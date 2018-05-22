  # David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'SpaceStationToUI'
require_relative 'Transformation'

module Deepspace
  class SpaceStation
    
    attr_reader :ammoPower, :fuelUnits, :name, :nMedals, :shieldPower, :hangar,
                :weapons, :shieldBoosters, :pendingDamage
    
    @@MAXFUEL=100
    @@SHIELDLOSSPERUNITSHOT=0.1
    
    def initialize(n, supplies, m, w, s, h, pd)
      @name = n
      @ammoPower = supplies.ammoPower
      assignFuelValue(supplies.fuelUnits)
      @shieldPower = supplies.shieldPower
      @nMedals = m
      
      @weapons = Array.new(w)
      @shieldBoosters = Array.new(s)
      
      if h != nil
        @hangar = Hangar.newCopy(h)
      else
        @hangar = nil
      end
      
      if pd != nil
        @pendingDamage = pd.copy
      else
        @pendingDamage = nil
      end
    end
    
    private
    def assignFuelValue(f)
      @fuelUnits = 0
      if f<=@@MAXFUEL && f >= 0
        @fuelUnits = f
      else
        @fuelUnits = @@MAXFUEL
      end
    end
    
    def cleanPendingDamage
      if @pendingDamage != nil && @pendingDamage.hasNoEffect
        @pendingDamage = nil
      end
    end
    
    public
    def cleanUpMountedItems
      
#      (@weapons.length-1).downto(0) { |i|
#        if @weapons[i].uses <= 0
#          @weapons.delete_at(i)
#        end
#      }
#      
#      (@shieldBoosters.length-1).downto(0) { |i|
#        if @shieldBoosters[i].uses <= 0
#          @shieldBoosters.delete_at(i)
#        end
#      }

      @weapons.delete_if { |x| x.uses <= 0}
      @shieldBoosters.delete_if { |x| x.uses <= 0}

    end
    
    def discardHangar
      @hangar=nil
    end
    
    def discardShieldBooster(i)
      if i>=0 && i<@shieldBoosters.length
        @shieldBoosters.delete_at(i)
        if pendingDamage!=nil
          pendingDamage.discardShieldBooster
          cleanPendingDamage
        end
      end
    end
    
    def discardShieldBoosterInHangar(i)
      if @hangar != nil 
        @hangar.removeShieldBooster(i)
      end
    end
    
    def discardWeapon(i)
      if i>=0 && i<@weapons.length
        w=@weapons.delete_at(i)
        if @pendingDamage!=nil
          @pendingDamage.discardWeapon(w)
          cleanPendingDamage
        end
      end
    end
    
    def discardWeaponInHangar(i)
      if @hangar!=nil
        @hangar.removeWeapon(i)
      end
    end
    
    def fire
      size = @weapons.length
      factor = 1
      
      for i in (0...size)
        factor*=@weapons[i].useIt
      end
      
      return factor*@ammoPower
    end
    
    def getSpeed
      return (@fuelUnits/@@MAXFUEL)
    end
    
    def getUIversion
      return SpaceStationToUI.new(self)
    end 
    
    def mountShieldBooster(i)
      if @hangar != nil
        s = @hangar.removeShieldBooster(i)
        if s != nil
          @shieldBoosters.push(s)
        end
      end
    end
    
    def mountWeapon(i)
      if @hangar != nil
        w = @hangar.removeWeapon(i)
        
        if w != nil
          @weapons.push(w)
        end
      end
    end  
    
    def move
      @fuelUnits -= getSpeed*@fuelUnits
    end
    
    def protection
      size=@shieldBoosters.length
      factor=1
      
      for i in (0...size)
        factor*=@shieldBoosters[i].useIt
      end
      return factor*@shieldPower
    end
    
    def receiveHangar(h)
      if @hangar == nil
        @hangar = h
      end
    end
    
    def receiveShieldBooster(s)
      if @hangar != nil
        return @hangar.addShieldBooster(s)
      end
    end
    
    def receiveShot(shot)
      myProtection = protection()
      
      if myProtection >= shot
        @shieldPower-=@@SHIELDLOSSPERUNITSHOT*shot
        @shieldPower=[0.0, @shieldPower].max
        return ShotResult::RESIST
      else
        @shieldPower=0.0
        return ShotResult::DONOTRESIST
      end
    end
    
    def receiveSupplies(s)
      @ammoPower += s.ammoPower
      @fuelUnits += s.fuelUnits
      @shieldPower += s.shieldPower
      if @fuelUnits > @@MAXFUEL
        @fuelUnits = @@MAXFUEL
      end
    end
    
    def receiveWeapon(w)
      if @hangar != nil
        return @hangar.addWeapon(w)
      end
    end
    
    def setLoot(loot)
      dealer=CardDealer.instance
      
      if loot.nHangars > 0
        receiveHangar(dealer.nextHangar)
      end
      
      for i in (0...loot.nSupplies)
        receiveSupplies(dealer.nextSuppliesPackage)
      end
      
      for j in (0...loot.nWeapons)
        receiveWeapon(dealer.nextWeapon)
      end
      
      for k in (0...loot.nShields)
        receiveShieldBooster(dealer.nextShieldBooster)
      end
      
      @nMedals+=loot.nMedals
      
      if loot.spaceCity
        return Transformation::SPACECITY
      elsif loot.efficient
        return Transformation::GETEFFICIENT
      else 
        return Transformation::NOTRANSFORM
      end
    end
    
    def setPendingDamage(d)
      @pendingDamage = d.adjust(@weapons, @shieldBoosters)
    end
    
    def validState
      cleanPendingDamage
      if @pendingDamage == nil
        return true
      end
      return false
    end
    
    def getSupplies
      SuppliesPackage.new(@ammoPower,@fuelUnits,@shieldPower)
    end

    def to_s
      return "Name #{@name} \nAmmoPower: #{@ammoPower} \nFuelUnits: #{@fuelUnits}
      ShieldPower: #{@shieldPower} \nMedals: #{@nMedals} \nWeapons: #{@weapons.join(", ")}
      ShieldBoosters: #{@shieldBoosters.join(", ")} \nHangar: #{@hangar} \nPendingDamage: #{@pendingDamage}"
    end

    protected :getSupplies
  end
end

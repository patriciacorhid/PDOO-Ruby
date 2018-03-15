# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class SpaceStation
    
    attr_reader :ammoPower, :fuelUnits, :name, :nMedals, :shieldPower, :hangar, :pendingDamage,
                :weapons, :shieldBoosters, :hangar, :pendingDamage
    
    @@MAXFUEL=100
    @@SHIELDLOSSPERUNITSHOT=0.1
    
    def initialize(n, supplies)
      @name = n
      @ammoPower = supplies.ammoPower
      @fuelUnits = supplies.fuelUnits
      @shieldPower = supplies.shieldPower
      @nMedals = 0
      
      @weapons = Array.new()
      @shieldBoosters = Array.new()
      @hangar = nil
      @pendingDamage = nil
      
    end
    
    private
    def assignFuelValue(f)
      if f<@@MAXFUEL
        @fuelUnits = f
      end
    end
    
    def cleanPendingDamage()
      if @pendingDamage.hasNoEffect == true
        @pendingDamage = nil
      end
    end
    
    public
    def cleanUpMountedItems
      for i in (0...@weapons.length)
        if @weapons[i].uses <= 0
          @weapons.delete_at(i)
        end
      end
      
      for i in (0...@shieldBoosters.length)
        if @shieldBoosters[i].uses <= 0
          @shieldBooster.delete_at(i)
        end
      end
    end
    
    def discardHangar
      hangar=nil
    end
    
    def discardShieldBooster(i)
      
    end
    
    def discardShieldBoosterInHangar(i)
      if @hangar != nil 
        @hangar.removeShieldBooster(i)
      end
    end
    
    def discardWeapon(i)
      
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
      fuelUnits -= getSpeed
    end
    
    def protection
      size=@weapon.length
      factor=1
      
      for i in (0...size)
        factor*=@shieldBooster[i].useIt
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
    end
    
    def receiveWeapons(w)
      if @hangar != nil
        return hangar.addWeapon(w)
      end
    end
    
    def setLoot(loot)
      dealer=CardDealer.getInstance
      
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
      
    end
    
    def setPendingDamage(d)
      @pendingDamage = d
    end
    
    def validState
      cleanPendingDamage
      if pendingDamage == nil
        return true
      end
        return false
    end

    def to_s
      return "Name #{@name} \nAmmoPower: #{@ammoPower} \nFuelUnits: #{@fuelUnits}
      \nShieldPower: #{@shieldPower} \nMedals: #{@nMedals} \nWeapons: #{@weapons}
      \nShieldBoosters: #{@shieldBoosters} \nHangar: #{@hangar} \nPendingDamage: #{@pendingDamage}"
    end
    
  end
end

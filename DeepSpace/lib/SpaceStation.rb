# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class SpaceStation
    
    attr_reader :ammoPower, :fuelUnits, :name, :nMedals, :shieldPower
    
    def initialize(n, supplies)
      @name = n
      @ammoPower = supplies.ammoPower
      @fuelUnits = supplies.fuelUnits
      @shieldPower = supplies.shieldPower
      #@nMedals = 0
    end
    
    private
    def assignFuelValue(f)
      @fuelUnits = f
    end
    
    def cleanPendingDamage()
      
    end
    
    public
    def cleanUpMountedItems
      
    end
    
    def discardHangar
      
    end
    
    def discardShieldBooster(i)
      
    end
    
    def discardShieldBoosterInHangar(i)
      
    end
    
    def discardWeapon(i)
      
    end
    
    def discartWeaponInHangar(i)
      
    end
    
    def fire
      
    end
    
    def getHangar
      
    end
    
    def getPendingDamage
      
    end
    
    def getShieldBooster
      
    end
    
    def getSpeed
      
    end
    
    def getUIversion
      
    end
    
    def getWeapons
      
    end
    
    def mountShieldBooster(i)
      
    end
    
    def mountWeapon(i)
      
    end  
    
    def move
      
    end
    
    def protection
      
    end
    
    def receiveHangar(h)
      
    end
    
    def receiveShieldBooster(s)
      
    end
    
    def receiveShot(shot)
      
    end
    
    def receiveSupplies(s)
      
    end
    
    def receiveWeapons(w)
      
    end
    
    def setLoot(loot)
      
    end
    
    def setPendingDamage(d)
      
    end
    
    def validState
      
    end

    def to_s
      return "AmmoPower: #{@ammoPower} \nFuelUnits: #{@fuelUnits} \nName #{@name} \nMedals: #{@nMedals} \nShieldPower: #{@shieldPower}"
    end
    
  end
end

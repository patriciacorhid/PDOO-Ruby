# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'HangarToUI'

module Deepspace
  class Hangar
    
    attr_reader :maxElements, :weapons, :shieldBoosters
    
    def initialize(capacity)
      @maxElements = capacity
      @weapons = Array.new
      @shieldBoosters = Array.new
    end
    
    def self.newCopy(h)
      copy = Hangar.new(h.maxElements)
      
      h.weapons.each { |w|
        copy.weapons.push(Weapon.newCopy(w))        
      }
      
      h.shieldBoosters.each { |s|
        copy.shieldBoosters.push(ShieldBooster.newCopy(s))
      }
      return copy
    end
    
    def getUIversion
      return HangarToUI.new(self)
    end
    
    private
    def spaceAvailable
      return @maxElements > (@weapons.length + @shieldBoosters.length)
    end
    
    public
    def addWeapon(w)
      if spaceAvailable
        @weapons.push(w)
        return true
      end
      return false
    end
    
    def addShieldBooster(s)
      if spaceAvailable
        @shieldBoosters.push(s)
        return true
      end
      return false
    end
        
    def removeShieldBooster(s)
      if 0 <= s && s < @shieldBoosters.length
        return @shieldBoosters.delete_at(s) 
      end
      return nil
    end
    
    def removeWeapon(w)
      if 0 <= w && w < @weapons.length
        return @weapons.delete_at(w)
      end
      return nil
    end
    
    def to_sweapons
      return "MaxElements: #{@maxElements} \nWeapons: #{@weapons.join(", ")} \nShieldBoosters: #{@shieldBoosters.join(", ")}"
    end
    
  end
end

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
      Hangar.new(h.maxElements)
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
      if 0 <= s && s < shieldBoosters.length
        shieldBoosters.delete_at(s) 
      end
      return nil
    end
    
    def removeWeapon(w)
      if 0 <= w && w < weapons.length
        weapons.delete__at(w)
      end
      return nil
    end
    
    def to_s
      return "MaxElements: #{@maxElements} \nWeapons: #{@weapons.join(", ")} \nShieldBoosters: #{@shieldBoosters.join(", ")}"
    end
    
  end
end

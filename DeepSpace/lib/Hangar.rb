# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class Hangar
    
    attr_reader :maxElements
    
    def initialize(capacity)
      @maxElements = capacity;
    end
    
    def self.newCopy(h)
      Hangar.new(h.maxElements)
    end
    
    def getUIversion
      
    end
    
    private
    def spaceAvailable
      
    end
    
    public
    def addWeapon(w)
      
    end
    
    def addShieldBooster(s)
      
    end
    
    def getShieldBoosters()
      
    end
    
    def getWeapons()
      
    end
    
    def removeShieldBooster(s)
      
    end
    
    def removeWeapon(w)
      
    end
    
    def to_s
      return "MaxElements: #{@maxElements}"
    end
    
  end
end

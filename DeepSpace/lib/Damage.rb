# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class Damage
    
    attr_reader :nShields, :nWeapons
    
    def initialize(s, w)
      @nShields = s
      @nWeapons = w
    end
    
    #NO SÉ CÓMO LLAMARLO
    def newDamage(wl, s)
      
    end
    
    def self.newCopy(d)
      self.new(d.nShields, d.nWeapons)
    end
    
    def getUIversion
      
    end
    
    private
    def adjust(w,s)
      
    end
    
    def arrayContainsType(w,t)
      
    end

    public
    def discardWeapon(w)
      
    end
    
    def discardShieldBooster(s)
      
    end
    
    def hasNoEffect
      
    end
    
    def getWeapons
      
    end
    
    def to_s
      return "Shields: #{@nShields} \nWeapons: #{@nWeapons}"
    end
  end
end

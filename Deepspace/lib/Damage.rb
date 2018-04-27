# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'DamageToUI'

module Deepspace
  class Damage
    
    attr_reader :nShields
     
    def initialize(s)
      @nShields = s
    end
         
    def getUIversion
      return DamageToUI.new(self)
    end
    
    def adjustShields(s)
      
      if(@nShields > s.length)
        return s.length 
      end
      
      return @nShields
    end
    
    def adjust(w,s)
    end

    def discardWeapon(w)
    end
    
    def discardShieldBooster
      if @nShields > 0
        @nShields -= 1
      end
    end
    
    def hasNoEffect
      return @nShields <= 0
    end
    
    def to_s
      return "nShields: #{@nShields}"
    end
    
    private_class_method :new
  end
end

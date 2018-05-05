# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'NumericDamageToUI'
require_relative 'Damage'
module Deepspace
  class NumericDamage < Damage
    
    public_class_method :new
    
    attr_reader :nWeapons
    
    def initialize(w,s)
      super(s)
      @nWeapons = w
    end
    
    def copy
      return NumericDamage.new(@nWeapons, nShields)
    end
    
    def getUIversion
      return NumericDamageToUI.new(self)
    end
    
    def adjust(w,s)
      
      nw = @nWeapons
      if @nWeapons > w.length
        nw = w.length
      end
      
      ns = adjustShields(s)
      
      return NumericDamage.new(nw, ns)
    end
    
    def discardWeapon(w)
      if @nWeapons > 0
        @nWeapons -= 1
      end
    end
    
    def hasNoEffect
      return (super && nWeapons <= 0)
    end
    
    def to_s
      "\nnWeapons: #{@nWeapons} \n#{super}" 
    end
    
  end
end

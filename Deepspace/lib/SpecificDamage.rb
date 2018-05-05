# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'SpecificDamageToUI'
require_relative 'Damage'

module Deepspace
  class SpecificDamage < Damage
    
    public_class_method :new
    
    attr_reader :weapons
    
    def initialize(wl, s)
      super(s)
      @weapons=Array.new(wl)
    end
    
    def copy
      return SpecificDamage.new(@weapons,nShields) 
    end
    
    def getUIversion
      return SpecificDamageToUI.new(self)
    end
    
    def adjust(w,s)
      ns = adjustShields(s);
      
      aux = SpecificDamage.new(@weapons,ns)
      copy = Array.new(w)
      
        @weapons.each {|x|
          index=arrayContainsType(copy, x)

          if(index==-1)
            aux.weapons.delete_at(aux.weapons.index(x))
          else
            copy.delete_at(index)
          end
        }
      
      return aux
    end
    
    private
    def arrayContainsType(w,t)
      index=-1
      for i in (0...w.length) do
        if(t == w[i].type)
          index = i
          break
        end
      end
      return index
    end
    
    public
    def discardWeapon(w)
      @weapons.delete_at(@weapons.index(w.type))
    end
    
    def hasNoEffect
      return (super && @weapons.length == 0)
    end
    
    def to_s
      return "\nWeapons: #{@weapons} \n#{super}"
    end
    
  end
end
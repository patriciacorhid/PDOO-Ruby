# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'DamageToUI'

module Deepspace
  class Damage
    
    attr_reader :weapons, :nShields, :nWeapons
     
    def initialize(s, w, wl)
      @nShields = s
      @nWeapons = w
      if(wl!=nil)
        @weapons=Array.new(wl)
      else
        @weapons=nil
      end
    end
    
    def self.newNumericWeapons(w, s)
      Damage.new(s,w,nil)
    end
    
    def self.newSpecificWeapons(wl, s)
      Damage.new(s,-1,wl)
    end
    
    def self.newCopy(d)
      Damage.new(d.nShields, d.nWeapons, d.weapons)
    end
    
    def getUIversion
      return DamageToUI.new(self)
    end
    
    def adjust(w,s)
      
      nw = @nWeapons
      if @nWeapons > w.length
        nw = w.length
      end
      
      ns = @nShields
      if @nShields > s.length
        ns = s.length
      end
      
      aux = Damage.new(ns, nw, @weapons)
      copy = Array.new(w)
      
      if @weapons != nil
        @weapons.each {|x|
          index=arrayContainsType(copy, x)

          if(index==-1)
            aux.weapons.delete_at(aux.weapons.index(x))
          else
            copy.delete_at(index)
          end
        }
      end
      
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
      if @weapons == nil && @nWeapons>0
        @nWeapons -= 1
      else
        @weapons.delete_at(@weapons.index(w.type))
      end
    end
    
    def discardShieldBooster
      if @nShields > 0
        @nShields -= 1
      end
    end
    
    def hasNoEffect
      return @nShields <= 0 && @nWeapons <= 0 && (@weapons == nil || @weapons.length == 0)
    end
    
    def to_s
      return "nShields: #{@nShields} \nnWeapons: #{@nWeapons} \nWeapons: #{@weapons}"
    end
  end
end

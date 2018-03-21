# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'HangarToUI'
require 'pp'

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
      puts "Llamada a addWeapon"
     # puts w.to_s
      if spaceAvailable
       # puts "aniado arma"
        @weapons.push(w)
        pp @weapons
     #   puts @weapons
     #   puts ""
        return true
      end
      return false
    end
    
    def addShieldBooster(s)
      puts "Llamada a addShieldBooster"
      if spaceAvailable
        @shieldBoosters.push(s)
        pp @shieldBoosters
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

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
  class SpaceCity < SpaceStation
    
    attr_reader :collaborators
    
    def initialize(bas, rest)
      ########
      @collaborators = Array.new(rest)
      @base=bas;
    end
    
    def getUIversion
      return SpaceCityToUI.new(self)
    end
    
    def fire
      suma = 0
      
      @collaborators.each {|c|
        suma+=c.fire
      }
      
      return suma
    end
    
    def protection
      suma = 0
      
      @collaborators.each{|c|
        suma+=c.protection
      }
      
      return suma
    end
    
    def setLoot(loot)
      super
      return Transformation::NOTRANSFORM
    end
  end
end

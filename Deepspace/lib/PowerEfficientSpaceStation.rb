# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
  class PowerEfficientSpaceStation < SpaceStation
    
    @@EFFICIENCYFACTOR = 1.1
    
    def initialize
      ######
    end
    
    def getUIversion
      return PowerEfficientSpaceStationToUI.new(self)
    end
    
    def fire
      return super*@@EFFICIENCYFACTOR
    end
    
    def protection
      return super*@@EFFICIENCYFACTOR
    end
    
    def setLoot(loot)
      if super==Transformation::GETEFFICIENT
        return Transformation::GETEFFICIENT
      else
        return Transformation::NOTRANSFORM
      end
    end
  end
end

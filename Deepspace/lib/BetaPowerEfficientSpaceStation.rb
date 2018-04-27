# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
  class BetaPowerEfficientSpaceStation < PowerEfficientSpaceStation
    
    @@EXTRAEFFICIENCY=1.2
    
    def initialize
      ####
      @dice= Dice.new
    end
    
    def getUIversion
      return BetaPowerEfficientSpaceStationToUI.new(self)
    end
    
    def fire
      factor = 1.0
      if dice.extraEfficienfy
        factor = @@EXTRAEFFICIENCY
      end
      
      return super*factor
    end
  end
end

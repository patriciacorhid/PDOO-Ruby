# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BetaPowerEfficientSpaceStationToUI'
require_relative 'Dice'

module Deepspace
  class BetaPowerEfficientSpaceStation < PowerEfficientSpaceStation
    
    @@EXTRAEFFICIENCY=1.2
    
    def initialize(st)
      super(st)
      @dice= Dice.new
    end
    
    def getUIversion
      return BetaPowerEfficientSpaceStationToUI.new(self)
    end
    
    def fire
      factor = 1.0
      if @dice.extraEfficiency
        factor = @@EXTRAEFFICIENCY
      end
      
      return super*factor
    end
  end
end

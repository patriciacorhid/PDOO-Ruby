# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class GameUniverse
    
    @@WIN = 10
    
    def initialize
      @gameState = GameStateController.new
      @turns = 0
      @dice = Dice.new
    end
    
    def combat(station, enemy)
      
    end
    
    def combat
      
    end
    
    def discardHangar
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.discardHangar
      end
    end
    
    def discardShieldBooster(i)
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.discardShieldBooster(i)
      end
    end
    
    def discardShieldBoosterInHangar(i)
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.discardShieldBoosterInHangar(i)
      end
    end
    
    def discardWeapon(i)
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.discardWeapon(i)
      end
    end
    
    def discardWeaponInHangar(i)
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.discardWeaponInHangar(i)
      end
    end
    
    def getState
      return @gameState.state
    end
    
    def getUIversion
      
    end
    
    def haveAWinner
      return @currentStation.nMedals >= @@WIN
    end
    
    def init(names)
      
    end
    
    def mountShieldBooster(i)
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.mountShieldBooster(i)
      end
    end
    
    def mountWeapon(i)
      if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
        @currentStation.mountWeapon(i)
      end
    end
    
    def nextTurn
      
    end
    
    def to_s
      return "Index: #{@currentStationIndex} + \nTurns: #{@turns}"
    end
    
  end
end

# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'GameStateController'
require_relative 'Dice'
require_relative 'CardDealer'
require_relative 'SpaceStation'
require_relative 'GameUniverseToUI'
require_relative 'EnemyStarShip'
require_relative 'CombatResult'
require_relative 'SpaceCity'
require_relative 'PowerEfficientSpaceStation'
require_relative 'BetaPowerEfficientSpaceStation'

module Deepspace
  class GameUniverse
    
    @@WIN = 5
    
    def initialize
      @gameState = GameStateController.new
      @turns = 0
      @dice = Dice.new
      @haveSpaceCity=false
    end
    
    def combatGo(station, enemy)
      
      if @dice.firstShot == GameCharacter::ENEMYSTARSHIP
        result = station.receiveShot(enemy.fire)
        
        if result == ShotResult::RESIST
          result = enemy.receiveShot(station.fire)
          enemyWins = (result == ShotResult::RESIST)
        else
          enemyWins = true
        end
        
      else
        result = enemy.receiveShot(station.fire)
        enemyWins = (result == ShotResult::RESIST)
      end
      
      if enemyWins
        if(!@dice.spaceStationMoves(station.getSpeed))
          station.setPendingDamage(enemy.damage)
          combatResult = CombatResult::ENEMYWINS
        else
          station.move
          combatResult = CombatResult::STATIONESCAPES
        end
        
      else
        trans = station.setLoot(enemy.loot)
        combatResult = CombatResult::STATIONWINSANDCONVERTS
        if trans == Transformation::GETEFFICIENT
          makeStationEfficient
        elsif trans == Transformation::SPACECITY && !@haveSpaceCity
          createSpaceCity
        else
          combatResult = CombatResult::STATIONWINS
        end
      end
      
      @gameState.next(@turns, @spaceStations.length)

      return combatResult
    end
    
    private
    def makeStationEfficient
      if @dice.extraEfficiency
        @currentStation = BetaPowerEfficientSpaceStation.new(@currentStation)
      else
        @currentStation = PowerEfficientSpaceStation.new(@currentStation)
      end
      
      @spaceStations[@currentStationIndex]=@currentStation
    end
    
    def createSpaceCity
        if !@haveSpaceCity
          rest = Array.new
          @spaceStations.each{|t|
            if t != @currentStation
              rest.push(t)
            end
          }
          @currentStation= SpaceCity.new(@currentStation, rest)
          @spaceStations[@currentStationIndex]=@currentStation
          @haveSpaceCity = true;
        end
    end
    
    public
    def combat
      state = @gameState.state
      if state == GameState::BEFORECOMBAT || state == GameState::INIT
        combatGo(@currentStation, @currentEnemy)
      else
        CombatResult::NOCOMBAT
      end     
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
    
    def state
      return @gameState.state
    end
    
    def getUIversion
      GameUniverseToUI.new(@currentStation, @currentEnemy)
    end
    
    def haveAWinner
      return @currentStation.nMedals >= @@WIN
    end
    
    def init(names)
      
      if @gameState.state == GameState::CANNOTPLAY
        @spaceStations = Array.new
        dealer = CardDealer.instance
        
        for name in names
          supplies = dealer.nextSuppliesPackage
          station = SpaceStation.new(name, supplies, 0, [], [], nil, nil)
          nh = @dice.initWithNHangars
          nw = @dice.initWithNWeapons
          ns = @dice.initWithNShields
          
          station.setLoot(Loot.new(0, nw, ns, nh, 0))
          @spaceStations.push(station)
        end
        
        @currentStationIndex = @dice.whoStarts(names.length)
        @currentStation = @spaceStations[@currentStationIndex]
        @currentEnemy = dealer.nextEnemy
        
        @gameState.next(@turns, @spaceStations.length)
        
      end
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
      if @gameState.state == GameState::AFTERCOMBAT
        
        if @currentStation.validState 
          @currentStationIndex = (@currentStationIndex+1)%@spaceStations.length
          @turns += 1
          
          @currentStation = @spaceStations[@currentStationIndex]
          @currentStation.cleanUpMountedItems
                  
          @currentEnemy = CardDealer.instance.nextEnemy
          @gameState.next(@turns, @spaceStations.length)
         
          return true
        end
        
        return false
      end
      
      return false
    end
    
    def to_s
      return "Index: #{@currentStationIndex} \nTurns: #{@turns} \nSpaceStations:
              #{@spaceStations.join(", ")} \nCurrentStation: #{@currentStation} \nCurrentEnemy: #{@currentEnemy}"
    end
    
  end
end

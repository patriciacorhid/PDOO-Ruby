# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'EnemyToUI'
require_relative 'ShotResult'

module Deepspace
  class EnemyStarShip
    
    attr_reader :ammoPower, :name, :shieldPower, :loot, :damage
    def initialize(n, a, s, l, d)
      @ammoPower = a
      @name = n
      @shieldPower = s
      @loot = l
      @damage = d
    end
    
    def self.newCopy(e)
      EnemyStarShip.new(e.name, e.ammoPower, e.shieldPower, e.loot, Damage.newCopy(e.damage))
    end
    
    def getUIversion
      EnemyToUI.new(self)
    end
    
    def fire
      return ammoPower
    end
        
    def protection
      return shieldPower
    end
    
    def receiveShot(shot)
      if shot > shieldPower
        return ShotResult::DONOTRESIST
      end
      return ShotResult::RESIST
    end
    
    def to_s
      return "Name: #{@name} \nAmmoPower: #{@ammoPower} \nShieldPower: #{@shieldPower} \nLoot:\n#{@loot} \nDamage:\n#{@damage}"
    end
 
  end
end

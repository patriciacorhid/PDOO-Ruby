# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class EnemyStarShip
    
    attr_reader :ammoPower, :name, :shieldPower
    def initialize(n, a, s, l, d)
      @ammoPower = a
      @name = n
      @shieldPower = s
    end
    
    def self.newCopy(e)
      EnemyStarShip.new(e.name, e.ammoPower, e.shieldPower)#faltan
    end
    
    def getUIversion
      
    end
    
    def fire
      
    end
    
    def getDamage
      
    end
    
    def getLoot
      
    end
    
    def protection
      
    end
    
    def recieveShot(shot)
      
    end
    
    def to_s
      return "Name: #{@name} \nAmmoPower: #{@ammoPower} \nShieldPower: #{shieldPower}"
    end
 
  end
end

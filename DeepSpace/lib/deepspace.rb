# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module Deepspace
  
   module GameCharacter
     SPACESTATION=:spacestation
     ENEMYSTARSHIP=:enemystarship
   end 
   
   module CombatResult
     ENEMYWINS=:enemywins
     NOCOMBAT=:nocombat
     STATIONSCAPES=:stationscapes
     STATIONWINS=:stationwins
   end
   
   module ShotResult
     DONOTRESIST=:donotresist
     RESIST=:resist
   end
   
   module WeaponType
     class Type
       
      attr_read :power
       
      def initialize(pow)
        @power=pow
      end
      
     end
     
      LASER=Type.new(2.0)
      MISSILE=Type.new(3.0)
      PLASMA=Type.new(4.0) 
   end
   
   class Loot
     
     attr_read :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals
   
     def initialize(sup, wea, shi, han, med)
       @nSupplies=sup
       @nWeapons=wea
       @nShields=shi
       @nHangars=han
       @nMedals=med
     end
   end
   
   class SuppliesPackage
     
     attr_read :ammoPower, :fuelUnits, :shieldPower
     
     def initialize(amm, fue, shi)
       @ammoPower=amm
       @fuelUnits=fue
       @shieldPower=shi
     end
     
     def self.newCopy(s)
       SuppliesPackage.new(s.ammoPower, 
         s.fuelUnits,
         s.shieldPower)
     end
   end
  
   class ShielBooster
     
     attr_read :boost, :uses
     
     def initialize(nam, boo, use)
       @name = nam
       @boost = boo
       @uses = use
     end
     
     def self.newCopy(s)
       ShieldBooster.new(s.name, s.boost, s.uses)
     end
     
     def useIt
       if @uses > 0
         @uses -= 1
         return @boost
       else
         return 1.0
       end
     end
   end
   
   class Weapon
     
     attr_read :type, :uses
     
     def initialize(nam, typ, use)
       @name = nam
       @type = typ
       @uses = use
     end
     
     def self.newCopy(w)
       Weapon.new(w.name, w.type, w.uses)
     end
     
     def power
       @type.power
     end
     
     def useIt
       if @uses > 0
         @uses -= 1
         power
       else
         1.0
       end
     end    
   end
   
   class Dice
     
     def initialize()
       @NHANGARSPROB = 0.25
       @NSHIELDSPROB = 0.25
       @NWEAPONSPROB = 0.33
       @FIRSTSHOTPROB = 0.5
       @generator = Random.new
     end
     
     def initWithNHangars()
       
       x = @generator.rand(1.0)
       
       if x < @NHANGARSPROB
         return 0
       else
         return 1
       end
     end
     
     def initWithNWeapons()
       
       x = @generator.rand(1.0)
     
       if x < @NWEAPONSPROB
         return 1
         
       elsif @NWEAPONSPROB <=x && x<@NWEAPONSPROB
         return 2
       
       else
         return 3
       end
     end
     
     def initWithShields()
       
       x = @generator.rand(1.0)
       
       if x < @NSHIELDSPROB
         return 0
       else
         return 1
       end
     end
    
     def whoStarts(nPlayers)
       return @generator.rand(nPlayers)
     end
     
     def firstShot()
       
       x = @generator.rand(1.0)
       
       if x < @FIRSTSHOTPROB
         return GameCharacter::SPACESTATION
       else
         return GameCharacter::ENEMYSTARSHIP
       end
       
     end
     
     def spaceStationMoves(speed)
       
       x = @generator.rand(1.0)
       
       if x < speed
         return true
       else
         return false
       end
     end
   end
   
end
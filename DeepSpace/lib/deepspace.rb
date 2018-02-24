# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

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
     
     def self.newCopy(original)
       new(original.ammoPower, 
         original.fuelUnits,
         original.shieldPower)
     end
   end
  
end

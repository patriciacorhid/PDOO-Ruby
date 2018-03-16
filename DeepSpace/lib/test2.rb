#encoding: utf-8
require_relative "CombatResult"
require_relative "GameCharacter"
require_relative "Loot"
require_relative "ShieldBooster"
require_relative "ShotResult"
require_relative "SuppliesPackage"
require_relative "Weapon"
require_relative "WeaponType"
require_relative 'Dice'

module Prueba
  
  class P2
    def main
      
   
    l1 = Deepspace::Weapon.new("PLASMA", Deepspace::WeaponType::PLASMA, 5)
    puts "Hola"
    puts "#{l1}"
    
    
    
    end
  end
  
  d = P2.new
  d.main
end

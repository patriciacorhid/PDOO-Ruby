# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'SuppliesPackage'
require_relative 'SpaceStation'
require_relative 'SpaceCity'
require_relative 'PowerEfficientSpaceStation'
require_relative 'BetaPowerEfficientSpaceStation'
require_relative 'NumericDamage'
require_relative 'SpecificDamage'
require_relative 'Weapon'
require_relative 'Hangar'
require_relative 'WeaponType'
require_relative 'ShieldBooster'

module Deepspace
  class Test4
    
    def self.main
      
      sp = SuppliesPackage.new(100.0, 60.0, 400.0)
      
      st = SpaceStation.new("Alpha", sp, [], [], nil, nil)
#      st2 = SpaceStation.new("Gamma", sp, [], [], nil, nil)
#      st3 = SpaceStation.new("Nicolas", sp, [], [], nil, nil)
#      
#      a = Array.new
#      
#      a.push(st2)
#      a.push(st3)
#      
#      sc = SpaceCity.new(st, a)
#      
#      puts "fire y protection"
#      puts sc.fire
#      puts sc.protection
      
      eff = PowerEfficientSpaceStation.new(st)
      betaEff = BetaPowerEfficientSpaceStation.new(st)
      
#      puts eff.fire
#      for k in (0...20)
#        puts betaEff.fire
#      end
      
      
      eff2 = PowerEfficientSpaceStation.new(eff)
      betaEff2 = BetaPowerEfficientSpaceStation.new(eff)
      
#      puts eff2.fire
#      for k in (0...20)
#        puts betaEff2.fire
#      end
      
      eff3 = PowerEfficientSpaceStation.new(betaEff)
      betaEff3 = BetaPowerEfficientSpaceStation.new(betaEff)
      
      puts eff2.fire
      for k in (0...20)
        puts betaEff2.fire
      end
      
      wt = Array.new([WeaponType::LASER,WeaponType::LASER,WeaponType::MISSILE])
      d = SpecificDamage.new(wt,2)
      
      w1= Weapon.new("Espada", WeaponType::LASER, 2)
      w2= Weapon.new("Espada", WeaponType::PLASMA, 2)
      w3= Weapon.new("Espada", WeaponType::MISSILE, 2)
      
      st.receiveHangar(Hangar.new(4))
      st.receiveWeapon(w1)
      st.mountWeapon(0)
      st.receiveWeapon(w1)
      st.mountWeapon(0)
      st.receiveWeapon(w3)
      st.mountWeapon(0)
      st.receiveWeapon(w2)
      st.mountWeapon(0)
      
      st.receiveShieldBooster(ShieldBooster.new("LALALA", 3.5, 4))
      st.mountShieldBooster(0)
      st.receiveShieldBooster(ShieldBooster.new("LALALA", 3.5, 4))
      st.receiveShieldBooster(ShieldBooster.new("LALALA", 3.5, 4))
      st.receiveShieldBooster(ShieldBooster.new("LALALA", 3.5, 4))
      st.mountShieldBooster(0)
      st.mountShieldBooster(0)
      
      puts d.adjust(st.weapons, st.shieldBoosters)
      
    end
  end
  
  Test4.main
end

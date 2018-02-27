# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'deepspace.rb'
class TestP1
    
  def self.main
    
    loot = Deepspace::Loot.new(2, 7, 5, 9, 4)
    sp = Deepspace::SuppliesPackage.new(3.9, 2.1, 8.3)
    spc = Deepspace::SuppliesPackage.newCopy(sp)
    sb = Deepspace::ShieldBooster.new("Table", 8.1, 3)
    sbc = Deepspace::ShieldBooster.newCopy(sb)
    laser = Deepspace::Weapon.new("Destroyer", Deepspace::WeaponType::LASER, 1)
    missile = Deepspace::Weapon.new("Exploder", Deepspace::WeaponType::MISSILE, 2)
    plasma = Deepspace::Weapon.new("Boom", Deepspace::WeaponType::PLASMA, 3)
    wc = Deepspace::Weapon.newCopy(missile)
    dice = Deepspace::Dice.new
    
    puts "Loot:"
    puts loot.nSupplies
    puts loot.nWeapons
    puts loot.nShields
    puts loot.nHangars
    puts loot.nMedals
    
    puts "\nSuppliesPackage:"
    puts sp.ammoPower
    puts sp.fuelUnits
    puts sp.shieldPower
    puts spc.ammoPower
    puts spc.fuelUnits
    puts spc.shieldPower
    
    puts "\nShieldBooster:"
    puts sb.boost
    puts sb.uses
    puts sb.useIt
    puts sb.useIt
    puts sb.useIt
    puts sb.useIt
    puts sb.useIt
    puts sbc.boost
    puts sbc.uses
    puts sbc.useIt
    puts sbc.useIt
    puts sbc.useIt
    puts sbc.useIt
    
    puts "\nWeapon"
    puts laser.type
    puts laser.uses
    puts laser.power
    puts laser.useIt
    puts laser.useIt
    puts missile.type
    puts missile.uses
    puts missile.power
    puts missile.useIt
    puts missile.useIt
    puts missile.useIt
    puts missile.useIt
    puts plasma.type
    puts plasma.uses
    puts plasma.power
    puts plasma.useIt
    puts plasma.useIt
    puts plasma.useIt
    puts plasma.useIt
    puts plasma.useIt
    puts wc.type
    puts wc.uses
    puts wc.power
    puts wc.useIt
    puts wc.useIt
    puts wc.useIt
    
    h0, h1, w1, w2, w3, s0, s1 = 0, 0, 0, 0, 0, 0, 0
    station, enemy, moves, doesnotmove = 0, 0, 0, 0
    players = [0, 0, 0, 0, 0]
    
    for i in (0...100)
      
      if dice.initWithNHangars == 1
        h1 += 1
      else
        h0 +=1
      end
      
      w = dice.initWithNWeapons
      case w
      when 1
        w1 += 1
      when 2
        w2 += 1
      when 3
        w3 += 1
      end
      
      if dice.initWithNShields == 1
        s1 += 1
      else
        s0 +=1
      end
      
      p = dice.whoStarts(players.size)
      players[p] += 1
      
      if dice.firstShot == Deepspace::GameCharacter::SPACESTATION
        station += 1
      else
        enemy += 1
      end
      
      if dice.spaceStationMoves(0.73)
        moves += 1
      else
        doesnotmove += 1
      end
    end
    
    print "\n0 Hangars: "
    puts h0
    print "1 Hangars: "
    puts h1
    print "0 Shields: "
    puts s0
    print "1 Shield: "
    puts s1
    print "1 Weapon: "
    puts w1
    print "2 Weapons: "
    puts w2
    print "3 Weapons: "
    puts w3
    puts "WhoStarts: "
    puts players#[0...players.size]
    puts "FirstShot: "
    print "Station: "
    puts station
    print "Enemy: "
    puts enemy
    puts "Station moves: "
    print "Yes: "
    puts moves
    print "No: "
    puts doesnotmove
  end 
end

TestP1.main

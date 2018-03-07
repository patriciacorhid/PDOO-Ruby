# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class Dice
    def initialize()
       @NHANGARSPROB = 0.25
       @NSHIELDSPROB = 0.25
       @NWEAPONSPROB = 0.33
       @FIRSTSHOTPROB = 0.5
       @generator = Random.new
     end
     
     def to_s
       return "NHANGARSPROB = #{@NHANGARSPROB} \nNSHIELDSPROB = #{@NSHIELDSPROB} \nNWEAPONSPROB = #{@NWEAPONSPROB} \nFIRSTSHOTPROB = #{@FIRSTSHOTPROB}"
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
         
       elsif @NWEAPONSPROB <=x && x<@NWEAPONSPROB*2
         return 2
       
       else
         return 3
       end
     end
     
     def initWithNShields()
       
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

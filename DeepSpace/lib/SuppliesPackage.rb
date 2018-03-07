# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module DeepSpace
  class SuppliesPackage
     attr_reader :ammoPower, :fuelUnits, :shieldPower
     
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
     
     def to_s
       return "ammoPower = #{@ammoPower} \nfuelUnits = #{@fuelUnits} \nshieldPower = #{@shieldPower}"
     end
  end
end

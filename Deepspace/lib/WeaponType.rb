# David Cabezas Berrido
# Patricia Córdoba Hidalgo

module Deepspace
  module WeaponType
     class Type
       
      attr_reader :power
       
      def initialize(typ, pow)
        @typeName = typ
        @power = pow
      end
      
      def to_s
        return "Type = #{@typeName} \nPower = #{@power}"
      end
      
     end
     
      LASER=Type.new("LASER", 2.0)
      MISSILE=Type.new("MISSILE", 3.0)
      PLASMA=Type.new("PLASMA", 4.0) 
  end
end

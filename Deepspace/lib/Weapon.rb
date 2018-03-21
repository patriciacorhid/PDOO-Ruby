# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'WeaponToUI'

module Deepspace
  class Weapon
    attr_reader :name, :type, :uses
     
     def initialize(nam, typ, use)
       @name = nam
       @type = typ
       @uses = use
     end
     
     def self.newCopy(w)
       Weapon.new(w.name, w.type, w.uses)
     end
     
     def getUIversion
       WeaponToUI.new(self)
     end
     
     def power
       @type.power
     end
     
     def to_s
       return "Name = #{@name} \n#{@type} \nUses = #{@uses}"
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
end

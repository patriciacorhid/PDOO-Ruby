# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'ShieldToUI'
module Deepspace
  class ShieldBooster
    attr_reader :name, :boost, :uses
     
     def initialize(nam, boo, use)
       @name = nam
       @boost = boo
       @uses = use
     end
     
     def self.newCopy(s)
       ShieldBooster.new(s.name, s.boost, s.uses)
     end
     
     def getUIversion
       ShieldToUI.new(self)
     end
     
     def to_s
       return "Name = #{@name} \nBoost = #{@boost} \nUses = #{@uses}"
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
end

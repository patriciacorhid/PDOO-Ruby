# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'LootToUI'

module Deepspace
  class Loot
     attr_reader :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals, :efficient, :spaceCity
   
     def initialize(sup, wea, shi, han, med, ef=false, cit=false)
       @nSupplies=sup
       @nWeapons=wea
       @nShields=shi
       @nHangars=han
       @nMedals=med
       @spaceCity=cit
       @efficient=ef
     end
          
     def getUIversion
       return LootToUI.new(self)
     end
     
     def to_s
       return "nSupplies = #{@nSupplies} \nnWeapons = #{@nWeapons} \nnShields = #{@nShields} \nnHangars = #{@nHangars} \nMedals = #{@nMedals}"
     end        
  end
end

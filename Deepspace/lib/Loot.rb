# David Cabezas Berrido
# Patricia Córdoba Hidalgo

require_relative 'LootToUI'

module Deepspace
  class Loot
     attr_reader :nSupplies, :nWeapons, :nShields, :nHangars, :nMedals
   
     def initialize(sup, wea, shi, han, med)
       @nSupplies=sup
       @nWeapons=wea
       @nShields=shi
       @nHangars=han
       @nMedals=med
     end
     
     def getUIversion
       return LootToUI.new(self)
     end
     
     def to_s
       return "nSupplies = #{@nSupplies} \nnWeapons = #{@nWeapons} \nnShields = #{@nShields} \nnHangars = #{@nHangars} \nMedals = #{@nMedals}"
     end        
  end
end

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "Damage"
require_relative "Weapon"
require_relative "WeaponType"
require 'pp'

module NewModule
    class Media
      def initialize()
        @media=0
      end
      
      def media(w)
        suma=0
        for i in (0...w.length)
          suma+=w[i].power
        end
        @media=(suma/w.length)
      end
      
      def self.main
        media1=Media.new
        w=Deepspace::Weapon.new("a", Deepspace::WeaponType::LASER, 4)
        w1=[w,w,w,w,w]
        
        puts w1
        puts media1.media(w1)
     end
    end
    
    Media.main
end

 
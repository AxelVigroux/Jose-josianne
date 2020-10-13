require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def battle
  player1 = Player.new("Axel")
  player2 = Player.new("Camille")
  
  puts "Voici l'état des joueurs :"
    puts player1.show_state
    puts player2.show_state 

    puts "Passons à la phase d'attaque"
  while player1.life_points > 0 && player2.life_points >0
    
    puts player2.attacks(player1)
    puts player1.attacks(player2)
  break if player2.life_points <= 0 
    
  end
end

def perform
  battle
end
perform





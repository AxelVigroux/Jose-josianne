require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "--------------------------------------------------"
puts "-    WELCOME TO THE DRUM & BASS PARTY MA FRIEND  -"
puts "-                 JUNGLE IS MASSIV               -" 
puts "--------------------------------------------------"

puts "Créer ton personnage !"
name_user = gets.chomp
user = HumanPlayer.new(name_user)

puts "Création de Josianne et José !"
player1 = Player.new("Josianne")
player2 = Player.new("José")
ennemies = [player1, player2]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  user.show_state
  puts "Quelle action veux-tu faire ? "
  puts "a - chercher une meilleur arme"
  puts "s - chercher a se soigner"
  puts "attaquer un joueur en vue"
  puts "0 - Josianne a #{player1.show_state}points de vie"
  puts "1 - José a #{player2.show_state}points de vie"
  answer = gets.chomp
  while ((answer != "a") and (answer != "s") and (answer != 0) and (answer != "1"))
		puts 'choisissez entre "a" "s" "0" ou "1"'	
		print "action:"
		answer = gets.chomp
	
		if (answer == "a") or (answer == "s") or (answer == "0") or (answer == "1")
			break
		end
	end
  if answer == "a"
    puts "------------------"
    user.search_weapon
    puts "------------------"
  elsif answer == "s"
    puts "------------------"
    user.search_health_pack
    puts "------------------"
    
  elsif answer == "0"

    puts "------------------"
    user.attacks(player1)
    puts "------------------"
    
  elsif answer == "1"
    puts "------------------"
    user.attacks(player2)
    puts "------------------"
    
  end
  puts "Attention un martien s'échappe !"
	ennemies.each {|fighter| 
		if fighter.life_points > 0 
		fighter.attacks(user) 
		end}
	puts "-----------------------------"
  end
puts "La partie est finie"
if user.life_points >0
	puts "Bien joué boloss"
else
	puts "T'es mort boloss"
end

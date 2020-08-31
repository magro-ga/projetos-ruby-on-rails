def warn_current_champion(data)
		puts "Nosso campeão(ã) atual é #{data[0]} com #{data[1]} pontos."
end

def warn_totaol_points(total_points)
		puts "Você possui #{total_points} pontos."
end

def warn_kick_effected kick
		puts "Você já chutou #{kick}"
end

def warn_letter_not_found
		puts "Letra não encontrada."
end

def warn_letter_found(total_searched)
		puts "Letra encontrada #{total_searched} vezes."
end

def warn_hit_word
	  puts "\nParabéns, você ganhou!"
	  puts

	  puts "       ___________      "
	  puts "      '._==_==_=_.'     "
	  puts "      .-\\:      /-.    "
	  puts "     | (|:.     |) |    "
	  puts "      '-|:.     |-'     "
	  puts "        \\::.    /      "
	  puts "         '::. .'        "
	  puts "           ) (          "
	  puts "         _.' '._        "
	  puts "        '-------'       "
	  puts
end

def warn_missed_word
		puts "Que pena... errou"
end

def warn_points(points_at_now)
		puts "Você ganhou #{points_at_now} pontos."
end

def say_welcome
		puts "/***************/"
		puts "/ Jogo da Forca */"
		puts "/***************/"
		puts "Qual o seu nome?"
		name = gets.strip
		puts "\n\n\n\n\n\n"
		puts "Começaremos o jogo para você, #{name}."
		name
end

def draw_fork(errors)
		head = "   "
		arms = "   "
		legs = "   "
		body = " "
		if errors >= 1
				head = "(_)"
		end
		if errors >= 2
				arms = " | "
				body = "|"
		end
		if errors >= 3
				body = "\\|/"
		end
		if errors >= 4
				legs = "/ \\"
		end
		puts " _____     \n"
		puts " |/   |		 \n"
		puts " |   #{head}  \n"  
		puts " |   #{arms}  \n"
		puts " |   #{body}     \n"
		puts " |   #{legs}    \n"
		puts " |   				\n"
		puts "_|___				\n"
		puts "\n\n"
end

def warn_choosing_word
		puts "Escolhendo uma palavra secreta..."
end

def warn_chosen_word(secret_word)
	  puts "Palavra secreta com #{secret_word.size} letras... boa sorte!"
		secret_word
end

def dont_want_play?
		puts "Deseja jogar novamente? (Y/N)"
		want_play = gets.strip
		dont_want_play =  want_play.upcase == "N"
end

def header_of_kicks(kicks, errors, mask)
		puts "\n\n\n\n"
		draw_fork errors
		puts "Palavra secreta é: #{mask}"
		puts "Erros até agora: #{errors}"
		puts "Chutes até agora: #{kicks}"
end

def ask_a_kick
		puts "Entre com uma letra ou uma palavra"
		kick = gets.strip.downcase
		puts "Será que acertou? Você chutou #{kick}"
		kick
end

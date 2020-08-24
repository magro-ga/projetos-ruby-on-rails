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
		puts "Parabéns! Acertou!"
end

def warn_missed_word
		puts "Que pena... errou"
end

def warn_points(points_at_now)
		puts "Você ganhou #{points_at_now} pontos."
end

def say_welcome
		puts "Bem vindo ao jogo da forca"
		puts "Qual o seu nome?"
		name = gets.strip
		puts "\n\n\n\n\n\n"
		puts "Começaremos o jogo para você, #{name}."
		name
end

def choice_secret_word
		puts "Escolhendo uma palavra secreta..."
		secret_word = "programador"
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
		puts "Palavra secreta é: #{mask}"
		puts "Erros até agora: #{errors}"
		puts "Chutes até agora: #{kicks}"
end

def ask_a_kick
		puts "Entre com uma letra ou uma palavra"
		kick = gets.strip
		puts "Será que acertou? Você chutou #{kick}"
		kick
end

def say_welcome
    puts "Bem Vindo ao Foge-foge"
    puts "Quall é o seu nome?"
    name = gets.strip
    puts "\n\n\n\n\n"
    puts "Começaremos o jogo para Você, #{name}"
    name
end

def write(map)
		puts map
end

def ask_move
		puts "Para onde deseja ir?"
		moviment = gets.strip
end

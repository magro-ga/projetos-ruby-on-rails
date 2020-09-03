def say_welcome
    puts "Bem vindo ao Run-Run"
    puts "Qual é o seu nome?"
    name = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{name}"
    name
end

def draw(map)
    puts map
end

def ask_movement
    puts "Para onde deseja ir?"
    moviment = gets.strip.upcase
end
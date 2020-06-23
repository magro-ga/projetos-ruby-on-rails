def welcome
    puts "Bem vindo ao jogo da Forca"
    puts "Qual o seu nome?"
    name = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começamos o jogo para você, #{name}."
end

def choosing_secret_word
    puts "Escolhendo uma palavra secreta..."
    secret_word = "programador"
    puts "Palavra secreta com #{secret_word.size} letras... boa sorte!"
    secret_word
end

def dont_want_to_play?
    puts "Deseja jogar novamente (S/N)"
    want_to_play = gets.strip
    dont_want_to_play = want_to_play.upcase == "N"
end

def ask_a_kick(kicks, mistakes)
    puts "\n\n\n\n"
    puts "Erros até agora #{mistakes}"
    puts "Chutes até agora #{kicks}"
    puts "Entre com uma letra ou uma palavras"
    kick = gets.strip
    puts "Será que acerotu? Você chutou #{kick}"
    kick
end

def play(name)
    secret_word = choosing_secret_word

    mistakes = 0
    kicks = []
    points = 0

    while mistakes < 5
        kick = ask_a_kick kicks, mistakes
        kicks << kick 
    end

    puts "Você ganhou #{points} pontos."
end

name = welcome

loop do
    play name
    if dont_want_to_play?
        break
    end
end
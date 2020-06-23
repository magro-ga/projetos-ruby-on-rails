def welcome
  puts "Bem vindo ao jogo da advinhação"
  puts "Qual é o seu nome?"
  nome = gets
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
end

def ask_dificult
  puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil)"
  dificult = gets.to_i
end

def draw_secret_number(dificult)
  case dificult
  when 1 
    max = 30
  when 2
    max = 60
  when 3
    max = 100
  when 4
    max = 150 
  else 
    max = 200
  end
  puts "Escolhendo um nº secreto entre 1 e #{max}..."
  draw = rand(max) + 1
  puts "Escolhido... que tal adivinhar hoje nosso nº secreto?"
  draw
end

def request_a_number(chutes, tentativa, limite_de_tentativas)
  puts "\n\n\n"
  puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
  puts "chutes até agora: " + chutes.to_s
  puts "Entre com o número"
  chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}"
  puts "\n"
  chute
end

def check_hit(numero_secreto, chute)
  acertou = numero_secreto == chute.to_i

  if acertou
    puts "Acertou!"
    return true
  end

  maior = numero_secreto > chute.to_i
  if maior
    puts "O número secreto é maior!"
  else
    puts "O número secreto é menor!"
  end
  false
end

def play (nome, dificult)
  numero_secreto = draw_secret_number dificult

  pontos_ate_agora = 1000
  limite_de_tentativas = 5
  chutes = []

  for tentativa in 1..limite_de_tentativas

    chute = request_a_number chutes, tentativa, limite_de_tentativas
    chutes << chute

    if nome == "Gabriel"
      puts "Acertou!"
      break
    end

    pontos_a_perder = (chute.to_i - numero_secreto).abs / 2.0
    pontos_ate_agora -= pontos_a_perder

    if check_hit numero_secreto, chute
      break
    end
  end
  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar
    puts "Defeseja jogar novamente? (S/N)"
    quer_jogar = gets.strip
    nao_quer_jogar = quer_jogar.upcase == "N"
end

nome = welcome
dificult = ask_dificult

loop do
    play nome, dificult
    if nao_quer_jogar
      break
    end
end 
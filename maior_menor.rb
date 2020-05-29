def welcome
  puts "Bem vindo ao jogo da advinhação"
  puts "Qual é o seu nome?"
  nome = gets
  puts "\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
end

def draw_secret_number
  puts "Escolhendo um nº secreto entre 0 e 200..."
  draw = 175
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

welcome
numero_secreto = draw_secret_number
limite_de_tentativas = 5
chutes = []
total_de_chutes = 0

for tentativa in 1..limite_de_tentativas

  chute = request_a_number chutes, tentativa, limite_de_tentativas
  chutes << chute

  if check_hit numero_secreto, chute
    break
  end
end

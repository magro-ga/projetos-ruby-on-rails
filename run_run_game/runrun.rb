require_relative 'ui'

def read_map(number)
    archive = "map#{number}.txt"
    text = File.read archive
    map = text.split "\n"
end

def play(name)
    map = read_map 1
    
    while true
        write map
        direction = ask_move
    end
end

def start_runrun
    name = say_welcome
    play name
end

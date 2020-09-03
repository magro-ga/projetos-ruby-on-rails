require_relative 'ui'

def read_map(number)
    archive = "map#{number}.txt"
    text = File.read archive
    map = text.split "\n"
end

def find_player(map)
    hero_caracter = "H"
    map.each_with_index do |line_atual, line|
        hero_column = line_atual.index hero_caracter
        if hero_column
            return [line, hero_column]
        end
    end
    # n achei
end

def calculates_new_position(hero, direction)
    hero = hero.dup
    case direction
       when "W"
          hero[0] -= 1
       when "S"    
          hero[0] += 1
       when "A"
          hero[1] -= 1
       when "D"
          hero[1] += 1
    end
    hero
end

def valid_position?(map, position)
    lines = map.size
    columns = map[0].size
    burst_lines = position[0] < 0 || position[0] >= lines
    burst_columns = position[1] < 0 || position[1] >= columns

    if burst_lines || burst_columns
        return false
    end

    if map[position[0]][position[1]] == "X"
        return false
    end
    true
end

def play(name)
    map = read_map 1

    while true
        draw map
        direction = ask_movement
        hero = find_player map
        new_position = calculates_new_position hero, direction

        if !valid_position? map, new_position
            next
        end
        
        map[hero[0]][hero[1]] = " "
        map[new_position[0]][new_position[1]] = "H"
    end
end

def start_runrun
    name = say_welcome
    play name
end
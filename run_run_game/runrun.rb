require_relative 'ui'

def read_map(number)
    archive = "map#{number}.txt"
    text = File.read archive
    map = text.split "\n"
end

def find_player(map)
    hero_caracter = "H"
    map.each_with_index do |current_line, line|
        hero_column = current_line.index hero_caracter
        if hero_column
            return [line, hero_column]
        end
    end
    # n achei
end

def calculates_new_position(hero, direction)
    hero = hero.dup
    moviments = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
    }
    moviment = moviments[direction]
    hero[0] += moviment[0]
    hero[1] += moviment[1]
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
    current_value = map[position[0]][position[1]]
    if current_value == "X" || current_value == "F"
        return false
    end
    true
end

def move_ghost(map, line, column)
    position = [line, column + 1]
    if valid_position? map, position
        map[line][column] = " "
        map[position[0]][position[1]] = "F"
    end
end

def move_ghosts(map)
    ghosts_caracter = "F"
    map.each_with_index do |current_line, line|
      current_line.chars.each_with_index do |current_caracter, column|
            is_ghost = current_caracter == ghosts_caracter
            if is_ghost
                move_ghost map, line, column
            end
        end
    end

end

def play(name)
    map = read_map 2

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

        move_ghosts map
    end
end

def start_runrun
    name = say_welcome
    play name
end
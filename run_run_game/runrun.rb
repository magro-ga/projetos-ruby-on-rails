require_relative 'ui'
require_relative 'hero'

def read_map(number)
    archive = "map#{number}.txt"
    text = File.read archive
    map = text.split "\n"
end

def find_player(map)
    hero_character = "H"
    map.each_with_index do |current_line, line|
        hero_column = current_line.index hero_character
        if hero_column
            player = Hero.new
            player.line = line
            player.column = hero_column
            return player
        end
    end
    nil
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

def vector_sum(vector1, vector2)
    [vector1[0] + vector2[0], vector1[1] + vector2[1]]
end

def valid_positions_in(map, new_map, position)
    positions = []
    moviments = [[+1, 0], [0, +1], [-1, 0], [0, -1]]
    moviments.each do |moviment|
        new_position = vector_sum(moviment, position)
        if valid_position?(map, new_position) && valid_position?(new_map, new_position)
            positions << new_position
        end
    end
    positions
end

def move_ghost(map, new_map, line, column)
    positions = valid_positions_in map, new_map, [line, column]
    if positions.empty?
        return
    end

    random = rand positions.size
    position = positions[random]
    map[line][column] = " "
    new_map[position[0]][position[1]] = "F"
end

def copy_map(map)
    new_map = map.join("\n").tr("F", " ").split "\n"
end

def move_ghosts(map)
    ghosts_character = "F"
    new_map = copy_map map
    map.each_with_index do |current_line, line|
      current_line.chars.each_with_index do |current_character, column|
            is_ghost = current_character == ghosts_character
            if is_ghost
                move_ghost map, new_map, line, column
            end
        end
    end
    new_map
end

def player_lost?(map)
    lost =  !find_player(map)
end

def play(name)
    map = read_map 2

    while true
        draw map
        direction = ask_movement
        hero = find_player map
        new_position = hero.calculates_new_position direction
        if !valid_position? map, new_position.to_array
            next
        end
        map[hero.column][hero.line] = " "
        map[new_position.line][new_position.column] = "H"

        map = move_ghosts map
        if player_lost? map
            game_over
            break
        end
    end
end

def start_runrun
    name = say_welcome
    play name
end
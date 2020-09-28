class Hero
    attr_accessor :line, :column 

    def calculates_new_position(direction)
        new_hero = dup
        moviments = {
            "W" => [-1, 0],
            "S" => [+1, 0],
            "A" => [0, -1],
            "D" => [0, +1]
        }
        moviment = moviments[direction]
        new_hero.line += moviment[0]
        new_hero.column += moviment[1]
        new_hero
    end  

    def right 
        calculates_new_position "D"
    end

    def left 
        calculates_new_position "A"
    end

    def up 
        calculates_new_position "W"
    end

    def down 
        calculates_new_position "S"
    end

    def to_array
        [line, column]
    end

    def remove_on(map)
        map[line][column] = " "        
    end

    def put_on(map)
        map[line][column] = "H"
    end
end

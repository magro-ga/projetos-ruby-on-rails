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

    def to_array
        [line, column]
    end
end

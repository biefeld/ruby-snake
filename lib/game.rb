class Game
    attr_accessor :score
    def initialize
        @score = 0
        @fruit_x = rand(GRID_W)
        @fruit_y = rand(GRID_H)
    end

    def draw
        unless $dead
            Circle.new(x: @fruit_x*GRID_SIZE + GRID_SIZE/2, y:@fruit_y*GRID_SIZE + GRID_SIZE/2, radius: GRID_SIZE/2, color: $fruit_color, z:5)
            # Square.new(x: @fruit_x*GRID_SIZE, y:@fruit_y*GRID_SIZE, size: GRID_SIZE, color: $fruit_color, z:5)
        end
        Text.new("Score: #{@score}", x: 1, y: 1, color: $text_color, font: $font, size: 25)
    end


    def scored(x,y)
        @fruit_x == x and @fruit_y == y
    end

    def add_score
        @score +=1 
        @fruit_x = rand(GRID_W)
        @fruit_y = rand(GRID_H)
    end

end
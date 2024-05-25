class Snake
    attr_accessor :direction
    def initialize 
        @positions = [[2,0], [2,1],[2,2],[2,3]]
        @direction = 'down'
        @growing = false
    end

    #For each element in positions array (each square of snake), draw it to screen
    def draw
        @positions.each do |position|
            Square.new(x: position[0]*GRID_SIZE, y:position[1]*GRID_SIZE, size: GRID_SIZE-1, color: $snake_color)
        end
    end

    #Remove last square of snake and then add a new one depending on the direction of movement
    def move
        if !@growing
            @positions.shift
        end
        case @direction
            when 'down'
               @positions.push([head[0], head[1]+1])  #Adds a tile to the head of the snake by adding one to the y-component
            when 'up'
                @positions.push([head[0], head[1]-1])
            when 'left'
                @positions.push([head[0]-1, head[1]])
            when 'right'
                @positions.push([head[0]+1, head[1]])
        end
        @growing = false
    end

    #Checks whether the snake will go back on itself if it moves    
    def change_dir(new_dir)
        case @direction
            when 'up' then new_dir != 'down'
            when 'down' then new_dir != 'up'
            when 'left' then new_dir != 'right'
            when 'right' then new_dir != 'left'
        end
    end

    def death_check
        if head[0] >= Window.width/GRID_SIZE or head[1] >= Window.height/GRID_SIZE or head[0] < 0 or head[1] < 0
            $dead = true
        end
    end


    def x
        head[0]
    end

    def y
        head[1]
    end

    def grow
        @growing = true
    end


    def cross
        if @positions.uniq.length != @positions.length
            $dead = true
        end
    end

    private 

    def head
        @positions.last
    end

    
end

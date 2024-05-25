require 'ruby2D'
require './lib/word.rb'
require './lib/snake.rb'
require './lib/game.rb'

# Constant definitions
$backg_color = "#a7eefa"
$text_color = "#8E7DBE"
$snake_color = "#D88C9A"
$head_color = "#fa4163"
$fruit_color = "#8fd88c"

$font = './font/Comfortaa-Medium.ttf'

set background: $backg_color
set title: "Snake"
set fps_cap: 10

GRID_SIZE = 20
GRID_H = Window.height/GRID_SIZE
GRID_W = Window.width/GRID_SIZE




#Creates instance of classes
game_over_text = Word.new(230,100)
score_text = Word.new(65,150)
snake = Snake.new
game = Game.new


#Refreshes the screen - main game loop
update do
    clear
    snake.death_check
    snake.cross
    if game.scored(snake.x, snake.y)
        game.add_score
        snake.grow
    end


    if $dead
        game_over_text.text ="Game over!"
        score_text.text = "Your score was #{game.score}! Press 'R' to retry"        
    else
        snake.move
        game.draw
    end
    
    snake.draw

    game_over_text.draw
    score_text.draw

end


#Gets the key pressed and checks if it is an arrow key and if snake can change direction
on :key_down do |event|
    if['up', 'down', 'left', 'right'].include?(event.key)
        if snake.change_dir(event.key)
            snake.direction = event.key
        end
    elsif event.key == 'r'
        snake = Snake.new
        game = Game.new
        $dead = false
        game_over_text.text = ""
        score_text.text = ""
    elsif event.key == 'escape' or event.key = 'q'
        close
    end
end


show

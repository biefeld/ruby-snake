class Word
    attr_accessor :text

    def initialize(x,y)
        @text = ""
        @x = x
        @y = y
    end

    def draw
        Text.new(@text, x: @x, y: @y, color: $text_color, z: 5, font: 'Comfortaa-Medium.ttf', size: 30)
    end
end

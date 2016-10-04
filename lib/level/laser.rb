class Laser

   attr_accessor :y, :x

  def initialize(x,y)
    @image = Gosu::Image.new('media/images/player/laser.png')
    @x = x
    @y = y - @image.height/2
  end

  def draw
    @image.draw(@x,@y,1)
  end
  def move!
    @x = @x + 10
  end
  def is_out?
    @x > Game::WINDOW_WIDTH
  end
  def height
    @image.height
  end
  def width
    @image.width
  end
end

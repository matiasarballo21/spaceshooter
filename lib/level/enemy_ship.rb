require_relative "laser"
class EnemyShip

  def initialize(image_path, points, velocity)
    @destroyed = false
    @points = points
    @velocity = velocity
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::WINDOW_WIDTH - @image.width
    @y = Random.rand(Game::WINDOW_HEIGHT - @image.height)
    @height = @image.height
    @width = @image.width
  end

  def draw
    @image.draw(@x,@y,1)
  end

  def is_out?
    @x <= 0
  end

  def move!
    @x -= @velocity
  end

  def was_hit?(laser)
    laser.any? {|laser| hit?(laser)}
  end

  def destroy!
    @destroyed = true
  end

  def destroyed?
    @destroyed
  end

  private

  def hit?(object)
    if @y > (object.y + object.height)
      false
    elsif (@y + @height) < object.y
      false
    elsif @x > (object.x + object.width)
      false
    elsif (@x + @width) < object.x
      false
    else
      true
    end
  end


end

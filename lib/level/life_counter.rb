class LifeCounter

  MARGIN_TOP = 10
  MARGIN_LEFT = 10
  MARGIN_INTERNAL_X = 4
  def initialize
    @lives = 10
    @image = Gosu::Image.new('media/images/power.png')
  end

  def draw
    @lives.times do |position|
      x = MARGIN_LEFT + position * (@image.width + MARGIN_INTERNAL_X)
      @image.draw(x, MARGIN_TOP, 1)
    end
  end
end

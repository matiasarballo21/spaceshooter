class Score
  MARGIN_RIGHT = 120
  MARGIN_TOP = 10
  def initialize
    @point = 0
    @text = Gosu::Font.new(40, name: Utils.default_font)
  end

  def draw
    @text.draw(@point, Game::WINDOW_WIDTH-MARGIN_RIGHT, MARGIN_TOP,1)
  end
end

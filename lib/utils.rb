module Utils

  FONT_SIZE_BIG = 90

  def self.default_font
    'media/fonts/letra.ttf'
  end

  def self.center_x(object)
    (Game::WINDOW_WIDTH / 2) - (object.width / 2)
  end

end

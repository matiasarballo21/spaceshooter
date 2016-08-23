class MainMenu

  def initialize(window)
    @title = Gosu::Image.from_text("Menu Principal", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@title)
    @window = window
  end

  def draw
    @title.draw(@x,0,0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      @window.close
    end
  end
end

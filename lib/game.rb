require 'gosu'

require_relative 'utils'
require_relative 'menu/main_menu'

class Game < Gosu::Window

  WINDOW_WIDTH = 1024
  WINDOW_HEIGHT = 600

  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT)
    self.caption = "SpaceShooter"
    @current_screen = MainMenu.new(self)
  end

  def draw
    @current_screen.draw
  end

  def button_down(id)
    @current_screen.button_down(id)
  end

  def update
  end

end

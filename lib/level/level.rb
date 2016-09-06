require_relative 'player_ship'
class Level

  def initialize(window)
    @window = window
    @player = PlayerShip.new

  end

  def draw
    @player.draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    end
  end

  def update
    if @window.button_down?(Gosu::KbUp) || @window.button_down?(Gosu::KbW)
      @player.move_up!
    elsif @window.button_down?(Gosu::KbDown) || @window.button_down?(Gosu::KbS)
      @player.move_down!
    end
  end

end

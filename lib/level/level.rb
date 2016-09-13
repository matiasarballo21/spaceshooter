require_relative 'player_ship'
require_relative 'laser'
require_relative 'score'
class Level

  def initialize(window)
    @window = window
    @player = PlayerShip.new
    @laser = []
    @score = Score.new
  end

  def draw
    @player.draw
    if @laser != nil
      @laser.each do |laser|
        laser.draw
      end
    end
    @score.draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    when Gosu::KbSpace ||
      laser = @player.shoot
      @laser << laser
    end
  end

  def update
    if @window.button_down?(Gosu::KbUp) || @window.button_down?(Gosu::KbW)
      @player.move_up!
    elsif @window.button_down?(Gosu::KbDown) || @window.button_down?(Gosu::KbS)
      @player.move_down!
    end
    if @laser != nil && !@laser.empty?
      @laser.each do |laser|
        laser.move!
      end
    end
    @laser.reject! {|laser| laser.is_out?}
  end

end

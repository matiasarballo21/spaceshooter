require_relative 'player_ship'
require_relative 'laser'
require_relative 'score'
require_relative 'life_counter'
require_relative 'enemy_ship'
class Level

  def initialize(window, enemy_ships_definitions)
    @window = window
    @player = PlayerShip.new
    @laser = []
    @score = Score.new
    @lives_counter = LifeCounter.new
    #@enemy_ship = EnemyShip.new('enemy_4.png',200, 10)
    @enemy_ships = []
    @enemy_ships_definitions = enemy_ships_definitions
  end

  def draw
    @player.draw
    if @laser != nil
      @laser.each do |laser|
        laser.draw
      end
    end
    @score.draw
    @lives_counter.draw
    if @enemy_ships != nil
      @enemy_ships.each do |enemy_ships|
        enemy_ships.draw
      end
    end
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    when Gosu::KbSpace
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
    create_enemy_ship
    if @enemy_ships != nil && !@enemy_ships.empty?
        @enemy_ships.each do |enemy_ship|
        enemy_ship.move!
        if enemy_ship.was_hit?(@laser)
          enemy_ship.destroy!
        elsif enemy_ship.is_out?
          @life_counter.lose_life!
        end
      end
    end

    @enemy_ships.reject! { |ship| ship.is_out? || ship.destroyed?}

  end

  def create_enemy_ship
    current_time = Gosu::milliseconds
    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ships < current_time)
      @last_enemy_ship_at = current_time
      info = @enemy_ships_definitions.sample
      @enemy_ships << EnemyShip.new(info[:image_path], info[:points], info[:velocity])
    end

  end

  def time_between_enemy_ships
    case @score.points
    when 0..1000
      3000
    when 1000..2000
      2000
    else
      1000
    end
  end


end

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    if !@game_over
      show_sequence
      require_sequence
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    guess = gets.chomp.to_a
    @game_over = true if guess != @seq
  end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    "round was successful"
  end

  def game_over_message
    "game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end



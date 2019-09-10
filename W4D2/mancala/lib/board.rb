class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    (0..5).each { |i| @cups[i] = [:stone, :stone, :stone, :stone] }
    (7..12).each { |i| @cups[i] = [:stone, :stone, :stone, :stone] }
    # @player1 = Player.new(name1, 6)
    # @player2 = Player.new(name2, 13)
    # @current_player = @player1
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0
      raise 'Invalid starting cup'
    elsif @cups[start_pos].empty?
      raise 'Starting cup is empty' 
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    until stones.empty?
      i += 1
      i = 0 if i > 13
      if i == 6
        @cups[6] << stones.shift if current_player_name == @name1
      elsif i == 13
        @cups[13] << stones.shift if current_player_name == @name2
      else
        @cups[i] << stones.shift
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count <= 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    if @cups[6].length > @cups[13].length
      @name1
    else
      @name2
    end
  end
end

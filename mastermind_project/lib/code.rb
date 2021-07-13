class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    return true if chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
    return false
  end

  def self.random(length)
    random_pegs= []
    length.times {random_pegs<< POSSIBLE_PEGS.keys.sample}
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    array= pegs.split("")
    Code.new(array)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count=0
    @pegs.each.with_index do |peg, i|
      if peg==guess[i]
        count+=1
      end
    end
    count
  end

  def num_near_matches(guess)
    count=0
    (0...guess.length).each do |i|
      if guess[i] != self[i] && self.pegs.include?(guess[i])
        count +=1
      end
    end
    count
  end

  def ==(code)
    @pegs== code.pegs
  end

  def initialize(pegs)
    if self.class.valid_pegs?(pegs)
      @pegs= pegs.map(&:upcase)
    else
      raise "Pegs not valid"
    end
  end













end

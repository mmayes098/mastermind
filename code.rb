class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(char_array)
      char_array.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(peg_array)
    if Code.valid_pegs?(peg_array)
      @pegs = peg_array.map(&:upcase)
    else
      raise "The pegs are not valid"
    end
  end

  def self.random(length)
    pegs = Array.new(length) { POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each_with_index do |char, idx|
      if guess[idx] == @pegs[idx]
        count += 1
      end
    end

    return count
  end

  def num_near_matches(guess)
    count = 0
    @pegs.each_with_index do |char, idx|
      if guess[idx] != @pegs[idx] && @pegs.include?(guess[idx])
        count += 1
      end
    end

    return count
  end

  def ==(instance)
    if self.pegs.length != instance.pegs.length
      false
    end

    self.pegs == instance.pegs
  end
end

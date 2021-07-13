class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word= self.class.random_word
    @guess_word= Array.new(@secret_word.length,"_")
    @attempted_chars= []
    @remaining_incorrect_guesses=5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indeces=[]
    @secret_word.each_char.with_index do |letter, index|
      matching_indeces<< index if char== letter
    end
    matching_indeces
  end


  def fill_indices(char, array)
    array.map{|index| @guess_word[index]=char}
  end

  def try_guess(char)
    fill_indices(char, get_matching_indices(char))
    if already_attempted?(char)
      p "That has already been attempted"
      return false
    else
      if get_matching_indices(char).empty?
        @remaining_incorrect_guesses-=1
      end
      @attempted_chars<< char
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char"
    guess= gets.chomp
    return self.try_guess(guess)
  end

  def win?
    if @guess_word.join("")==@secret_word
      puts "WIN"
      return true
    end
    false
  end

  def lose?
    if remaining_incorrect_guesses<1
      p "LOSE"
      return true
    end
    false
  end

def game_over?
  if self.win? || self.lose?
    p @secret_word
    return true
  end
  false
end

end

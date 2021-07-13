require "set"
require_relative "player"

class GhostGame
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5


    def initialize(*players)
        words= File.readlines("dictionary.txt").map(&:chomp)
        @dictionary= Set.new(words)
        @players= players
        @losses = Hash.new{ |losses, player| losses[player] = 0}
        @fragment=[]

    def next_player!
        @players.rotate!
    end

    def current_player
        @players.first
    end

    def previous_player
        @players.last
    end

    def take_turn(player)
        puts "It's"

    def valid_play?(letter)
        return false unless ALPHABET.include??(letter)
        potential_fragment= @fragment + letter

        dictionary.any? {|word| word.start_with?(potential_fragment)}
    end

    def play
        self.current_player.guess(@fragment)








end

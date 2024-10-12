# frozen_string_literal: true

require_relative 'playable'

module StudioGame
  # player class
  class Player
    include Playable
    attr_reader :found_treasures
    attr_accessor :name, :health

    def self.from_csv(line)
      name, health = line.split(',')
      Player.new(name, Integer(health))
    rescue ArgumentError
      puts "#{health} is just no valid health value love."
      Player.new(name)
    end

    def initialize(name, health = 100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end

    def to_s
      "I'm #{@name} with a health = #{@health}, points = #{points}, and score = #{score}"
    end

    def score
      @health + points
    end

    def found_treasure(name, points)
      @found_treasures[name] += points
    end

    def points
      @found_treasures.values.sum
    end
  end

  if __FILE__ == $0 # rubocop:disable Style/SpecialGlobalVars
    player = Player.new('jase')
    puts player.name
    puts player.health
    player.boost
    puts player.health
    player.drain
    puts player.health
  end
end

# frozen_string_literal: true

# player class
class Player
  attr_reader :health, :found_treasures
  attr_accessor :name

  def self.from_csv(line)
    name, health = line.split(',')
    Player.new(name, health.to_i)
  end

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with a health = #{@health}, points = #{points}, and score = #{score}"
  end

  def drain
    @health -= 10
  end

  def boost
    @health += 15
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

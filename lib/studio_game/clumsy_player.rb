# frozen_string_literal: true

require_relative 'player'

# clumsy player class
class ClumsyPlayer < Player
  def initialize(name, health)
    super(name, health)
    @boost_factor = 5
  end

  def found_treasure(name, points)
    points /= 2
    super(name, points)
  end

  def boost
    @boost_factor.times { super }
  end
end

if __FILE__ == $PROGRAM_NAME
  clumsy = ClumsyPlayer.new('klutz')

  clumsy.found_treasure('flute', 50)
  clumsy.found_treasure('flute', 50)
  clumsy.found_treasure('flute', 50)
  clumsy.found_treasure('star', 100)

  clumsy.found_treasures.each do |name, points|
    puts "#{name}: #{points} points"
  end
  puts "#{clumsy.points} total points"
end

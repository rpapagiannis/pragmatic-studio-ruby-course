# frozen_string_literal: true

require_relative 'player'

module StudioGame
  # just_some_class
  class BerserkPlayer < Player
    attr_reader :boost_count

    def initialize(name, health = 100)
      super(name, health)
      @boost_count = 0
    end

    def berserk?
      @boost_count > 5
    end

    def boost
      super
      @boost_count += 1
      puts "#{@name} is berserk!" if berserk?
    end

    def drain
      berserk? ? boost : super
    end
  end

  if __FILE__ == $PROGRAM_NAME
    berserker = BerserkPlayer.new('berserker', 50)
    6.times { berserker.boost }
    2.times { berserker.drain }
    puts berserker.health
  end
end

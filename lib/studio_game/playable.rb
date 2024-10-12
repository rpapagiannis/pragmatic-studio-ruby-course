# frozen_string_literal: true

module StudioGame
  # includes shared playable behavior
  module Playable
    def drain
      self.health -= 10
    end

    def boost
      self.health += 15
    end
  end
end

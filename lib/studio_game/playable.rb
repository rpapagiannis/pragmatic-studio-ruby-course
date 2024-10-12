# frozen_string_literal: true

# includes shared playable behavior
module Playable
  def drain
    self.health -= 10
  end

  def boost
    self.health += 15
  end
end

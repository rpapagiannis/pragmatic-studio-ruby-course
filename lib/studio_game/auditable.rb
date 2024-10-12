# frozen_string_literal: true

# module that audits dice rolls
module Auditable
  def audit(number)
    puts "Audit: Rolled a #{number}"
  end
end

require_relative '../command'
require_relative './base'

class Command::Cd < Command::Base
  attr_reader :thought

  def perform
    user.update(current_thought: thought)
  end
end

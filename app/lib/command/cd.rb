require_relative './base'

class Command
  class Cd < Command::Base
    def perform
      if thought
        user.update(current_thought: thought)
        thought.content
      end
    end

    protected

    def parse_args
      @thought_id = args[0]
    end

    def thought
      @thought ||= Thought.where(id: @thought_id).first
    end
  end
end

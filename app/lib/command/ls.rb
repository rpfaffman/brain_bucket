require_relative './base'

class Command
  class Ls < Command::Base
    def perform
      user.current_thought.children.map{|x| "* #{x.content}"}.join("\n")
    end
  end
end

class Command
  class Base
    attr_reader :user, :args

    def initialize(user, args)
      @user = user
      @args = args
      parse_args
    end

    protected

    def parse_args
      # implement me in a subclass
    end
  end
end

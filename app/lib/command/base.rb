class Command
  class Base
    attr_reader :user, :args

    def initialize(user, args)
      @user = user
      @args = args

      # set the args as instance variables
      args.each { |k,v| instance_variable_set("@#{k.to_s}", v) }
    end
  end
end

class Command
  attr_reader :user

  def initialize(user)
    @user = user
  end

  # delegate to command classes
  def method_missing(name, args, &block)
    klass = "Command::#{name.to_s.capitalize}".split("::").reduce(Module, :const_get)
    klass.new(user, args, &block).perform
  end
end

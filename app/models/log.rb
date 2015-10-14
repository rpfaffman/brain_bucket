class Log < Sequel::Model
  plugin :validation_helpers

  def before_create
    self.created_at ||= Time.now
    self.dump = dump.to_s
    super
  end

  def validate
    super
    validates_presence :event
  end
end

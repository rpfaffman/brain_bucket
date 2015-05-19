class Neuron < Sequel::Model
  many_to_one :user
  many_to_many :neurons,
    left_key: :from_id,
    right_key: :to_id,
    join_table: :axons

  def before_create
    self.created_at ||= Time.now
    super
  end
end

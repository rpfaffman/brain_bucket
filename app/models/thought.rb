class Thought < Sequel::Model
  many_to_one :user
  many_to_one :parent,
    class: :Thought,
    key: :parent_id
  one_to_many :children,
    class: :Thought,
    key: :parent_id

  def before_create
    self.created_at ||= Time.now
    super
  end

  def title
    "(#{id}) #{content[0,50]}"
  end

  def siblings
    parent.children - [self]
  end
end

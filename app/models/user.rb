class User < Sequel::Model
  one_to_many :thoughts
  many_to_one :current_thought, class: :Thought

  def before_create
    self.created_at ||= Time.now
    super
  end

  def think(content)
    thought = Thought.create(content: content)
    add_thought(thought)
    # associate thought to current or make it current
    current_thought ? current_thought.add_child(thought) : update(current_thought: thought)
  end
end

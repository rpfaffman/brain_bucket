class User < Sequel::Model
  one_to_many :neurons
  many_to_one :current_neuron, class: Neuron

  def before_create
    self.created_at ||= Time.now
    super
  end

  def create_neuron(content)
    neuron = Neuron.create(content: content)
    add_neuron(neuron)
    # associate neuron to current or make it current
    current_neuron ? current_neuron.add_neuron(neuron) : update(current_neuron: neuron)
  end
end

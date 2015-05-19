Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      DateTime :created_at
      text :identifier
      integer :current_neuron_id
    end

    create_table :neurons do
      primary_key :id
      integer :user_id
      DateTime :created_at
      text :content
    end

    create_table :axons do
      primary_key :id
      DateTime :created_at
      integer :from_id
      integer :to_id
    end
  end
end

Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      DateTime :created_at
      text :identifier
      integer :current_thought_id
      float :sms_number
    end

    create_table :thoughts do
      primary_key :id
      integer :user_id
      integer :parent_id
      DateTime :created_at
      text :content
    end
  end
end

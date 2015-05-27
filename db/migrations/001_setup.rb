Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      integer :current_thought_id
      timestamp :created_at
      text :identifier
      text :sms_number
      index [:id, :sms_number]
    end

    create_table :thoughts do
      primary_key :id
      integer :user_id
      integer :parent_id
      timestamp :created_at
      text :content
      index [:user_id, :parent_id, :content], unique: true
    end
  end
end

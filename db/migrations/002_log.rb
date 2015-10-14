Sequel.migration do
  change do
    create_table :logs do
      primary_key :id
      timestamp :created_at
      text :event
      text :dump
      index [:id]
    end
  end
end

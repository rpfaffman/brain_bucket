Sequel.migration do
  change do
    create_table(:schema_info) do
      Integer :version, :default=>0, :null=>false
    end
    
    create_table(:thoughts) do
      primary_key :id
      DateTime :created_at
      String :title, :text=>true
      String :content, :text=>true
    end
  end
end

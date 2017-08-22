Hanami::Model.migration do
  change do
    create_table :messages do
      column :id, :BigInt, null: false, primary_key: true
      column :ticket_id, :BigInt, null: false

      column :body, String
      column :author, String
      column :note, "bool"
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

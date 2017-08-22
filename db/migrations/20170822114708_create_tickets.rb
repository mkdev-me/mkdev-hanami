Hanami::Model.migration do
  change do
    create_table :tickets do
      column :id, :BigInt, null: false, primary_key: true
      column :customer_id, :BigInt, null: false
      column :folder_ids, "bigint[]"

      column :title, String
      column :tags, "text[]"
      column :state, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

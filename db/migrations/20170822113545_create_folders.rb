Hanami::Model.migration do
  change do
    create_table :folders do
      column :id, :BigInt, null: false, primary_key: true

      column :name, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

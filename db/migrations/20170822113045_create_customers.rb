Hanami::Model.migration do
  change do
    create_table :customers do
      column :id, :BigInt, null: false, primary_key: true

      column :email, String, unique: true
      column :name, String
      column :about, String
      column :twitter_username, String
      column :title, String
      column :company_name, String
      column :phone_number, String
      column :location, String
      column :website_url, String
      column :linkedin_username, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end

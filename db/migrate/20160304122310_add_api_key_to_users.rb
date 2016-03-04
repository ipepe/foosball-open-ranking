class AddApiKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apikey, :string, unique: true
  end
end

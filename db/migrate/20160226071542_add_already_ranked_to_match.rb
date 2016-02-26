class AddAlreadyRankedToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :already_ranked, :boolean, default: false, null: false
  end
end

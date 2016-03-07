class AddPlayerRatingChange < ActiveRecord::Migration
  def change
    create_table :player_rating_changes do |t|
      t.belongs_to :player, null: false
      t.belongs_to :match, null: false
      t.integer :rating_points_difference, null: false

      t.timestamps null: false
    end
    Match.rerank_players
  end
end

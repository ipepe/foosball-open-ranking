class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :nickname, null: false, unique: true
      t.integer :rating_points, null: false, default: 1500
      t.belongs_to :user
      t.integer :created_by_id, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :matches do |t|
      t.integer :red_team_score, null: false, default: 0
      t.integer :blue_team_score, null: false, default: 0

      t.integer  :created_by_id, foreign_key: true, null: false
      t.integer  :confirmed_by_id, foreign_key: true
      t.datetime :confirmed_at, foreign_key: true

      t.integer :red_team_player_one_id,  foreign_key: true, null: false
      t.integer :red_team_player_two_id,  foreign_key: true, null: false
      t.integer :blue_team_player_one_id, foreign_key: true, null: false
      t.integer :blue_team_player_two_id, foreign_key: true, null: false

      t.date :date

      t.timestamps null: false
    end
  end
end

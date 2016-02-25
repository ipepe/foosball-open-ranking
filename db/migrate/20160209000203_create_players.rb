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

      t.date :date

      t.timestamps null: false
    end

    create_table :player_match_participations do |t|
      t.belongs_to :player, index: true, null: false
      t.belongs_to :match, index: true, null: false

      t.boolean :confirmed, default: false, null: false

      t.integer :team_color

      t.timestamps null: false
    end

    add_index :player_match_participations, [:player_id, :match_id], unique: true
  end
end

class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :nickname, null: false, unique: true

      t.timestamps null: false
    end

    create_table :matches do |t|
      t.integer :red_team_score, null: false
      t.integer :blue_team_score, null: false
      t.date :date

      t.timestamps null: false
    end

    create_table :player_match_participations do |t|
      t.belongs_to :player, index: true, null: false
      t.belongs_to :match, index: true, null: false

      t.integer :team_color

      t.timestamps null: false
    end
  end
end

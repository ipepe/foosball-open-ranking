namespace :players do
  task rerank: :environment do
    puts
    puts "#{DateTime.now} Uruchamiam players:rerank w env: #{Rails.env}"
    ActiveRecord::Base.transaction do
      Player.all.update_all({rating_points: 1500})
      Match.where.not(confirmed_by_id: nil).order(confirmed_at: :desc).each do |match|
        match.rerank_players
      end
    end
    puts "#{DateTime.now} Koniec players:rerank w env: #{Rails.env}"
    puts
  end
end
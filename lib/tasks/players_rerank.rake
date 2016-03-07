namespace :players do
  task rerank: :environment do
    puts
    puts "#{DateTime.now} Uruchamiam players:rerank w env: #{Rails.env}"
    Match.rerank_players
    puts "#{DateTime.now} Koniec players:rerank w env: #{Rails.env}"
    puts
  end
end
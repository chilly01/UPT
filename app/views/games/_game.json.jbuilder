json.extract! game, :id, :name, :notes, :tour_id, :venue_id, :start_time, :day, :created_at, :updated_at
json.url game_url(game, format: :json)

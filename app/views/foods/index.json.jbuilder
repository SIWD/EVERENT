json.array!(@foods) do |food|
  json.extract! food, :id
  json.url food_url(food, format: :json)
end

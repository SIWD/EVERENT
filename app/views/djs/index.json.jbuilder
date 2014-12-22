json.array!(@djs) do |dj|
  json.extract! dj, :id, :maxCapacity, :userService, :category
  json.url dj_url(dj, format: :json)
end

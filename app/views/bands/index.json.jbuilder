json.array!(@bands) do |band|
  json.extract! band, :id, :maxCapacity, :members, :userService_id, :category_id
  json.url band_url(band, format: :json)
end

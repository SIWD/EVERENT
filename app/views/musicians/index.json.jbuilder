json.array!(@musicians) do |musician|
  json.extract! musician, :id, :hasEquipment
  json.url musician_url(musician, format: :json)
end

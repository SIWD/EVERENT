json.array!(@services) do |service|
  json.extract! service, :id, :description, :maxCapacity, :name, :premiumServiceEnd, :teaser, :Business_id
  json.url service_url(service, format: :json)
end

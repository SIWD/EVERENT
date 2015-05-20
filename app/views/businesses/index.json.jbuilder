json.array!(@businesses) do |business|
  json.extract! business, :id, :name
  json.url business_url(business, format: :json)
end

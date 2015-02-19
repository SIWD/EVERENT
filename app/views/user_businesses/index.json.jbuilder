json.array!(@user_businesses) do |user_business|
  json.extract! user_business, :id, :position
  json.url user_business_url(user_business, format: :json)
end

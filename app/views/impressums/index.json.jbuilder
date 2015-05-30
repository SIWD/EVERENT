json.array!(@impressums) do |impressum|
  json.extract! impressum, :id
  json.url impressum_url(impressum, format: :json)
end

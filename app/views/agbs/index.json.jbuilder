json.array!(@agbs) do |agb|
  json.extract! agb, :id
  json.url agb_url(agb, format: :json)
end

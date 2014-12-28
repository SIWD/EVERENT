json.array!(@music_types) do |music_type|
  json.extract! music_type, :id, :name, :description
  json.url music_type_url(music_type, format: :json)
end

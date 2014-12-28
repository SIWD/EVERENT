json.array!(@musician_music_types) do |musician_music_type|
  json.extract! musician_music_type, :id
  json.url musician_music_type_url(musician_music_type, format: :json)
end

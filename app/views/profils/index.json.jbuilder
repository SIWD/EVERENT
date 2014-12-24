json.array!(@profils) do |profil|
  json.extract! profil, :id, :gender, :firstname, :lastname, :phone, :city, :postcode, :streetname, :housenumber, :user_id
  json.url profil_url(profil, format: :json)
end

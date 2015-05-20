json.array!(@profiles) do |profile|
  json.extract! profile, :id, :gender, :firstname, :lastname, :phone, :city, :postcode, :streetname, :housenumber, :user_id
  json.url profile_url(profile, format: :json)
end

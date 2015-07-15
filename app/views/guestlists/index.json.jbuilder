json.array!(@guestlists) do |guestlist|
  json.extract! guestlist, :id
  json.url guestlist_url(guestlist, format: :json)
end

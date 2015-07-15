json.array!(@guestlist_details) do |guestlist_detail|
  json.extract! guestlist_detail, :id, :event_id, :active, :size, :offer, :end_date, :end_time
  json.url guestlist_detail_url(guestlist_detail, format: :json)
end

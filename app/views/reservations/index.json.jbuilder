json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :from, :until, :listing_id, :user_id
  json.url reservation_url(reservation, format: :json)
end

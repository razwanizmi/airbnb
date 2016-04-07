json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :location, :contact, :picture, :user_id
  json.url profile_url(profile, format: :json)
end

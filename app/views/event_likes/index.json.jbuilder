json.array!(@event_likes) do |event_like|
  json.extract! event_like, :id, :event_id, :user_id
  json.url event_like_url(event_like, format: :json)
end

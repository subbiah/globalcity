json.array!(@events) do |event|
  json.extract! event, :id, :title, :sdesc, :bdesc, :event_type, :user_id, :association_id, :society_id, :association_name, :society_name, :member_type, :eventimages
  json.url event_url(event, format: :json)
end

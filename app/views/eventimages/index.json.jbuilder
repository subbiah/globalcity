json.array!(@eventimages) do |eventimage|
  json.extract! eventimage, :id, :image_url, :event_id, :image_type
  json.url eventimage_url(eventimage, format: :json)
end

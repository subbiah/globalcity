class Event < ActiveRecord::Base
  has_many :eventimages
  has_many :event_comments
  has_many :event_likes
end

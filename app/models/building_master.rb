class BuildingMaster < ActiveRecord::Base
   belongs_to :society_master    
   has_many :flats
end

class AssociationMaster < ActiveRecord::Base
  belongs_to :township_master
   has_many :society_masters
   
   scope :with_post, :joins => {:society_masters => {:building_masters => :flats}}
   
    
end

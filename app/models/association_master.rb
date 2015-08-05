class AssociationMaster < ActiveRecord::Base
  belongs_to :township_master
   has_many :society_masters
end

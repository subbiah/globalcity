class SocietyMaster < ActiveRecord::Base
  belongs_to :association_master
  has_many :building_masters
end

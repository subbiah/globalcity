class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :gclife_registration
  has_many :gclife_registration_flatdetails

  def user_details
  	user_details = Hash.new
  	user_details[:user] = self
  	user_details[:flat_details] = self.gclife_registration_flatdetails

  	return user_details
  end
  # accepts_nested_attributes_for :gclife_registration_flatdetails, :allow_destroy => true
  
end

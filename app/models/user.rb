class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates_presence_of :mobile
  validates :mobile,
            :uniqueness => {
                :case_sensitive => false
            }

  has_one :gclife_registration
  has_many :gclife_registration_flatdetails
  has_many :role_type
  has_many :member_types
   has_one :image

  def user_details
  	user_details = Hash.new
  	#user_details[:user] = self
  	#user_details[:flat_details] = self.gclife_registration_flatdetails
    user_details = self.to_json(:include => :gclife_registration_flatdetails)
    #user_details[:flat_details] = self.gclife_registration_flatdetails
  	return user_details
  end
  # accepts_nested_attributes_for :gclife_registration_flatdetails, :allow_destroy => true
  
  def send_notification(tittle, message, id, category)
    gcm = GCM.new("AIzaSyCaRC7Cfahy41WKzUHPWTeXwlhHBABypkc")    
    registration_ids= [self.device_token] # an array of one or more client registration IDs
    options = {data: {tittle: tittle, message: message, category: category, event: id}, collapse_key: "updated_score"}
    response = gcm.send(registration_ids, options)
  
    puts response
  end

end

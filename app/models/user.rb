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
   has_and_belongs_to_many :events

  def user_details
  	user_details = Hash.new
  	#user_details[:user] = self
  	#user_details[:flat_details] = self.gclife_registration_flatdetails
    user_details = self.to_json(:include => :gclife_registration_flatdetails) 
    #user_details[:flat_details] = self.gclife_registration_flatdetails
  	return user_details
  end
  # accepts_nested_attributes_for :gclife_registration_flatdetails, :allow_destroy => true

  def user_flats(flat_id)
    return User.includes(:gclife_registration_flatdetails).where(gclife_registration_flatdetails: {user_id: self.id, id: flat_id})[0].to_json(:include => :gclife_registration_flatdetails)
  end
  
  def send_notification(tittle, message, id, category)
    if self.device_token != nil && self.device_token != ""
       gcm = GCM.new("AIzaSyBm1STkd533t0-Pox3Ni1KaaDyI7BTM1Ws") 
       # fcm = FCM.new("AIzaSyBIdiIRJkVvCN9-e7ucEAsuO_I1gvxQCCI")
   
      registration_ids= [self.device_token] # an array of one or more client registration IDs
      randCode = rand(5..10000)
      options = {data: {tittle: tittle, message: message, category: category, event: id, notId: randCode}, collapse_key: "updated_score"}
      response = gcm.send(registration_ids, options)
    
      puts "::::::::::::::::  Id:::::::::::: "
      puts randCode
      puts "::::::::::::::::  Id end:::::::::::: "
      puts ":::::::::::::::: #{self.email}"
      puts "::::::::::::::::  nitification response"
      puts response
    end
  end

end

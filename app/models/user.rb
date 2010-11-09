class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable

	# Setup accessible (or protected) attributes for your model
	attr_accessible :email, :password, :password_confirmation, :username
  
	validates_presence_of :username
  
	has_many :authentications
  
	def apply_omniauth(omniauth)
		self.email = omniauth['user_info']['email'] if email.blank?
		authentications.build(:provider => omniauth["provider"], :uid => omniauth["uid"])
	end

	def password_required?
		(authentications.empty? || !password.blank?) && super
	end
	
	def providers
		p = []
		authentications.map { |auth| p.push auth.provider } 
		p
	end
end

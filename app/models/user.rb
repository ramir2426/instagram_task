class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:instagram] 

	def self.from_omniauth(auth)
		full_name = auth.extra.raw_info.full_name.present? ? auth.extra.raw_info.full_name :  "System User"
		email =   auth.extra.raw_info.email.present? ? auth.extra.raw_info.email :  "#{auth.extra.raw_info.username}@gmail.com"
		where(provider: auth.provider, uid: auth.uid).first_or_create(provider: auth.provider, uid: auth.uid, password:  Devise.friendly_token[0,20], email: email, full_name: full_name  ) 
		# where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		# 	user.provider = auth.provider
		# 	user.uid = auth.uid
		# 	user.password = Devise.friendly_token[0,20]
		# end  
	end
end

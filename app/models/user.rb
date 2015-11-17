class User < ActiveRecord::Base

	validates :email,
	presence: true,
	#have emails that are unique, pass as a hash
	uniqueness: {case_sensitive: false},
  email: true

  has_many :posts
  
  # validated :password,
  # presence: true

  #shortened version:
  validates_presence_of :password, on: :create
  #chain diff. validators after that

	has_secure_password

  def self.authenticate email, password
    #pass email parameter to return a user
    User.find_by_email(email).try(:authenticate, password)
  end
end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :job_title, :location, :details, :photo, :paypal_email, :password, :password_confirmation, :remember_me
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small => "150x150>" }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # Validating the presence of a name attribute
  validates :name, :presence => true
                   #:length => { :maximum => 70 }

  #validates :paypal_email, :format => { :with => email_regex }
	  
end

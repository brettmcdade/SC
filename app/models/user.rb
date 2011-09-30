class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :name, :email, :job_title, :location, :details, :photo, :paypal_email, :password, :password_confirmation, :remember_me
  
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100#",
      :small => "150x150>" }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # Validating the presence of a name attribute
  validates :name, :presence => true
                   #:length => { :maximum => 70 }
				   
  # Validating the presence of the username attribute
  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  validates_format_of :user_name, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :user_name, :maximum => 32
  
  # Creates a way for me to put username into the user route instead of just the id
  def to_param
    user_name
  end
  
  def strip_and_downcase_user_name
    if user_name.present?
      user_name.strip!
      user_name.downcase!
    end
  end

  #validates :paypal_email, :format => { :with => email_regex }

  
end

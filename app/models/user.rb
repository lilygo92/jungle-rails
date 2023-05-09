class User < ApplicationRecord

  has_secure_password

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    @user = User.where("lower(email) = ?", email.downcase).first

    if @user && @user.authenticate(password) 
      return @user 
    else 
      return nil
    end

  end
  
  def new
  end

  def create
  end
end
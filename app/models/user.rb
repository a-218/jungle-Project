class User < ActiveRecord::Base

  has_secure_password
  


  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  #validates :password_digest, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    
    email = email.downcase.strip
    @user = User.find_by_email(email)


    if @user && @user.authenticate(password)
      return @user
    else 
      return nil
    end
  end


end

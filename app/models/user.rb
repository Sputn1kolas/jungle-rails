class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { in: 5..20 }

  validates :email, uniqueness: { case_sensitive: false }, presence: true

  validates :name, presence: true

  has_many :ratings

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by('email': email.downcase.strip)
    if @user
      @user.authenticate(password)
      puts "user authenticated.."
      return @user
    else
      puts " not logging in..."
      return nil
    end
  end
end

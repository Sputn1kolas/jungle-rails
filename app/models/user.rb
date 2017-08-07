class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, length: { in: 5..20 },  presence: true

  validates :email, uniqueness: { case_sensitive: false }, presence: true

  validates :name, presence: true

  has_many :ratings

  def authenticate_with_credentials(params[:email], params[:password])
    @user = User.find_by('email': params[:email])
    if @user && @user.authenticate(params[:password])
      puts "user authenticated.."
      return True
    else
      puts " not logging in..."
      return False
    end

  end

end

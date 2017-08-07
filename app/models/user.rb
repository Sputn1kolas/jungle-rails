class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  validates :name, presence: true

  has_many :ratings


end

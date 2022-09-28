class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)

    email = email.strip.downcase

    if User.find_by(email: email)&.authenticate(password)
      user = User.find_by(email: email)
    else
      nil
    end
  end

end

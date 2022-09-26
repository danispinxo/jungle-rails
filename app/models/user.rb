class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)

    if User.find_by(email: email)&.authenticate(password)
      user
    else
      nil
    end
  end

end

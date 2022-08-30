class User < ApplicationRecord

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email)
    if [user, email, password].any?(nil)
      return nil
    end
    user.authenticate(password) || nil
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

end

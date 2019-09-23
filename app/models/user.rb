class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { in: 6..20 }

  def self.authenticate_with_credentials(email, password)
    emailChange = email.downcase.strip
    check = User.find_by_email(emailChange)
    checker = check.authenticate(password)
    if check && checker
      return check
    else
      return nil
    end
  end
end

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true
  after_initialize :ensure_session_token

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def self.generate_session_token
    SecureRandom::base64(128)
  end

  def reset_session_token!
    self.session_token ||= SecureRandom::base64(128)
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::base64(128)
  end

  def is_password?(password)
    bc_obj = BCrypt::Password.new(password_digest)

    bc_obj.is_password?(password)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password? ? user : nil
  end

end

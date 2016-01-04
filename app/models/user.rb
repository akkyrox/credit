class User < ActiveRecord::Base

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  PHONE_REGEX = /\A(\+\d{1,3}[- ]?)?\d{10}\Z/i

  has_many :shared_phones
  validates_presence_of :email, :format => EMAIL_REGEX
  validates_presence_of :phone, :format => PHONE_REGEX
  validates_length_of :password, :in => 6..20, :on => :create
  before_create { generate_token(:auth_token) }

  has_secure_password

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

end

class User < ActiveRecord::Base
  devise :database_authenticatable,
         :rememberable, :trackable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates_presence_of :email, :first_name, :last_name

  has_many :players

  def label
    "#{first_name} #{last_name} (#{email})"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def active_for_authentication?
    super && self.email.include?('@in4mates.com')
  end
end
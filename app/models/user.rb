class User < ActiveRecord::Base
  attr_accessor :name, :email_address, :remember_token
  # before_save { email.downcase! }
  validates :username,  presence: true, length: { minimum: 3 }
  validates :email_address, presence: true, length: { minimum: 4 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  # def initialize(attributes = {})
  #   @name  = attributes[:name]
  #   @email = attributes[:email]
  # end

    # Returns the hash digest of the given string.
    class << self

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def new_token
    SecureRandom.urlsafe_base64
  end
end
   def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

   def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

      def forget
    update_attribute(:remember_digest, nil)
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end
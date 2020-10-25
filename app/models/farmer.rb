class Farmer < ApplicationRecord
    attr_accessor :remember_token
    before_save {self.email = email.downcase }
    
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                        length: {maximum: 255},
                        format: {with: VALID_EMAIL_REGEX},
                        uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, allow_nil:true
    validates :tel, presence: true, length: {in: 10..11}
    validates :postal_code, presence: true
    validates :prefecture, presence: true
    validates :address, presence: true
    validates :comment, presence: true

    has_many :products, dependent: :destroy

    has_many :farmer_images, dependent: :destroy
    accepts_nested_attributes_for :farmer_images

    def Farmer.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def Farmer.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = Farmer.new_token
        update_attribute(:remember_digest, Farmer.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end
end

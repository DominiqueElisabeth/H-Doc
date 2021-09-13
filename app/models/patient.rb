class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, # :authentication_keys => [:name],
         :registerable, :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable #, :confirmable,
        #  :omniauthable, omniauth_providers: [:google_oauth2]
        #  :trackable

  has_many :posts
  has_many :appointments
  has_many :doctors, through: :appointments

  validates :name,     presence: true, length: {maximum: 20}
  validates :email,    presence: true, length: {maximum: 255},
                       uniqueness: true
                      #  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  before_validation { email.downcase! }

  def will_save_change_to_email?
    true
  end
end

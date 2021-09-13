class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :timeoutable, :lockable, :trackable,
         :validatable

  has_many :appointments, dependent: :destroy
  has_many :posts, through: :appointments

  validates :name,     presence: true, length: {maximum: 20}
  validates :password, presence: true, length: { minimum: 6 }, on: :create
                      #  format: { with: /\A[\w+\-.] }


  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end

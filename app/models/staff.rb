class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, # :registerable,
         :timeoutable, :lockable, :trackable,
         :validatable

  has_many :guide_statuses

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

class Post < ApplicationRecord
  validates :symptom, presence: true, length: {in: 1..200}
  belongs_to :patient
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  has_many :comments, dependent: :destroy

end

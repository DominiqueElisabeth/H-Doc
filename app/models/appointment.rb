class Appointment < ApplicationRecord
  belongs_to :post
  belongs_to :doctor
  validates :time, presence: true
  validates :date, presence: true
  
end

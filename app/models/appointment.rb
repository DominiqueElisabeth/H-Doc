class Appointment < ApplicationRecord
  belongs_to :post
  belongs_to :doctor
end

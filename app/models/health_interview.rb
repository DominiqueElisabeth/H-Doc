class HealthInterview < ApplicationRecord
  belongs_to :patient
  has_one :guide_status, dependent: :destroy
  accepts_nested_attributes_for :guide_status, allow_destroy: true

  scope :with_guide_status, -> { includes(:guide_status) }
  scope :search_initial, -> { where(guide_statuses: {status: "initial"}) }
  scope :search_calling, -> { where(guide_statuses: {status: "calling"}) }
  scope :search_pending, -> { where(guide_statuses: {status: "pending"}) }
  # scope :already, lambda{|current_patient| includes(:patient).where(:patients => {:id => current_patient}) }
end

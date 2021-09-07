class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :sorted, -> { all.order(created_at: :asc) }
  scope :pagination, -> (params) { page(params[:page]).per(8) }
end

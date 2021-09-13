class Comment < ApplicationRecord
  belongs_to :post
   belongs_to :doctor, optional: true
  validates :content, presence: true
end

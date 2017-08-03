class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_numericality_of :rating, presence: true, greater_than: 0, less_than: 6
  validates :user_id, presence: true
  validates :product_id, presence: true
end

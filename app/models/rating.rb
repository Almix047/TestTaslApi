class Rating < ApplicationRecord
  belongs_to :post

  validates :point, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: 'Only integers from 1 to 5'}
end

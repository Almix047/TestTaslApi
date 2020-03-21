class Post < ApplicationRecord
  belongs_to :user
  has_many :rating, dependent: :destroy
end

class Product < ApplicationRecord
  has_one_attached :photo
  validates :title, :description, :price, presence: true
  belongs_to :category
end

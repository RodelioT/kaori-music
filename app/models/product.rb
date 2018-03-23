class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, uniqueness: true

  belongs_to :category

  mount_uploader :image, ImageUploader
end

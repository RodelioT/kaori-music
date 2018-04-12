class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, uniqueness: true

  belongs_to :category

  has_many :purchases

  mount_uploader :image, ImageUploader
end

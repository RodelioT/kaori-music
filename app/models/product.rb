class Product < ApplicationRecord
  validates :name, :price, presence: true
  validates :name, uniqueness: true

  belongs_to :category

  # accepts_nested_attributes_for :category, allow_destroy: true;
end

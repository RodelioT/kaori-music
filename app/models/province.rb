class Province < ApplicationRecord
  validates :name, :taxRate, presence: true
  validates :name, uniqueness: true

  has_many :customers
end

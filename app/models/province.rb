class Province < ApplicationRecord
  validates :name, :taxRate, presence: true
  validates :name, uniqueness: true
end

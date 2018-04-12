class Status < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :orders
end

class Product < ApplicationRecord
  belongs_to :department, optional: true

  validates :price, presence: true
  validates :name, length: { minimum: 4 }
end

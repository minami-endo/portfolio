class Item < ApplicationRecord
  attachment :image
  has_many :recipes, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 30 }
  validates :caption, presence: true, length: { minimum: 1, maximum: 100 }
  validates :image, presence: true
  validates :price, presence: true
end

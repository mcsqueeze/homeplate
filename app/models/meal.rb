class Meal < ApplicationRecord
  belongs_to :user
  monetize :price_cents

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :maxservings, presence: true
  validates :category, presence: true, inclusion: { in: ["appetizer", "main course", "dessert", "side", "other"]}
end

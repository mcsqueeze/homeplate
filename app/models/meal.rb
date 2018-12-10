class Meal < ApplicationRecord
  belongs_to :user
  has_many :pictures
  has_many :reviews
  accepts_nested_attributes_for :pictures


  monetize :price_cents

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: ["appetizer", "main course", "dessert", "side", "other"]}



 def self.published
    Meal.where(published: true)
 end

  def self.unpublished
    Meal.where(published: false)
 end

end

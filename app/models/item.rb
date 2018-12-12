class Item < ApplicationRecord
  belongs_to :meal
  belongs_to :order
  validates :quantity, presence: true
  validate :available

  def available

    meal = Meal.find(self.meal_id)
    if self.quantity > meal.maxservings
    errors.add(:quantity, "Can't be greater than available servings")

    end
  end
end


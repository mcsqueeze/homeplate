class Meal < ApplicationRecord
  belongs_to :user

  include PgSearch
  pg_search_scope :global_search,
    against: [:title, :description],
    associated_against: {
        user: [:address]
        },
    using: {
      tsearch: { prefix: true }
    }

  has_many :pictures
  has_many :reviews
  accepts_nested_attributes_for :pictures

  monetize :price_cents

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: ["appetizer", "main course", "dessert", "side", "other"]}

  def self.published(meals)
    meals.where(published: true)
  end

  def self.unpublished(meals)
    meals.where(published: false)
  end
end

class Meal < ApplicationRecord
  belongs_to :user
  has_many :pictures
  has_many :reviews
  accepts_nested_attributes_for :pictures
  #after_initialize :init

  monetize :price_cents

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :category, presence: true, inclusion: { in: ["appetizer", "main course", "dessert", "side", "other"]}

# def init
#   self.published == true if self.published.nil?
# end

# def self.published
#   where(published: true)
# end


end

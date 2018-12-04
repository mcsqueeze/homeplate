class Order < ApplicationRecord
  belongs_to :user
  has_many :items
  monetize :amount_cents
end

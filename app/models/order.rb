class Order < ApplicationRecord
  belongs_to :user
  has_many :items
  monetize :amount_cents

  validates :state, presence: true, inclusion: { in: ["pending", "deleted", "paid"]}

end

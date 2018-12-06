class Order < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  monetize :amount_cents

  validates :state, presence: true, inclusion: { in: ["pending", "deleted", "paid"]}
end

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :meals, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :payments, through: :orders

  validates :usertype, presence: true, inclusion: { in: ["cook", "customer"] }
  validates :photo, presence: true
end

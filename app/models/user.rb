class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :meals, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :payments, through: :orders
  has_many :user_reviews, class_name: "Review", foreign_key: "user_id"
  has_many :cook_reviews, class_name: "Review", foreign_key: "cook_id"

  validates :usertype, presence: true, inclusion: { in: ["cook", "customer"]}
  validates :photo, presence: true
end

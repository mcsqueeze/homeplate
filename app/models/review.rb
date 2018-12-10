class Review < ApplicationRecord
  belongs_to :user
  belongs_to :meal, optional: true
  belongs_to :cook, class_name: "User", foreign_key: "cook_id"
end

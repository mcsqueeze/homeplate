class Review < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :meal, optional: true
  belongs_to :cook, class_name: "User", foreign_key: "cook_id"
end

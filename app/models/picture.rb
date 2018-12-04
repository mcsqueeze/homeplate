class Picture < ApplicationRecord
  belongs_to :meal

  mount_uploader :url, PhotoUploader
end

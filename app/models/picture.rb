class Picture < ApplicationRecord
  belongs_to :meal
  mount_uploader :url, UrlUploader
end

class Item < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }

  mount_uploader :picture, PictureUploader
end

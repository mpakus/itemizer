class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :name, :picture, length: { maximum: 255 }

  mount_uploader :picture, PictureUploader
end

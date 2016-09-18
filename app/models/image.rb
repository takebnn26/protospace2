class Image < ActiveRecord::Base
  # mount_uploader :content, ImageUploader
  enum content_type: {main: 0, sub: 1}
  belongs_to :prototype
end

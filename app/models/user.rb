class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email,:name, :group, :profile, :works, presence: true
  mount_uploader :image, ImageUploader
  has_many :prototypes
end

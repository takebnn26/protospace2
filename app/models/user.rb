class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email,:name, :group, :profile, :works, presence: true
  mount_uploader :image, ImageUploader
  has_many :prototypes
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

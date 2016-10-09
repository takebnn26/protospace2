class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :images, dependent: :destroy
  has_many   :comments, dependent: :destroy
  has_many   :likes, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:content].blank? }
  validates :images, :title, :concept, :catch_copy, presence: true
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end

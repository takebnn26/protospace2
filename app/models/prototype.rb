class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many   :images
  has_many   :comments
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: proc { |attributes| attributes[:content].blank? }
  validates :images, presence: true
end

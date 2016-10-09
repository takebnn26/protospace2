class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype
  validates :text, :user_id, :prototype_id, presence: true
end

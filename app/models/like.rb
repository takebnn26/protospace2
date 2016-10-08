class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: :likes_count
  def like_user(user_id)
    like.find_by(user_id: user_id)
  end
end

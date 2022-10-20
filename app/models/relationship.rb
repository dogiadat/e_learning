class Relationship < ApplicationRecord
  include ActivitiesHelper

  belongs_to :followed, class_name: User.name
  belongs_to :follower, class_name: User.name

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create :create_activity_follow
  after_create :create_activity_unfollow

  private
  def create_activity_follow
    create_activity self.follower_id, self.followed.id, :followed
  end

  def create_activity_unfollow
    create_activity self.follower_id, self.followed.id, :unfollowed
  end
end

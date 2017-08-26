class Post < ApplicationRecord
  mount_uploader :img_path, ImgUploader
  has_many :likes
  has_many :comments
  belongs_to :user
  def has_like(user)
    self.likes.where(user_id: user.id).count > 0
  end
  def like_toggle(user)
    if has_like(user)
      Like.where(post: self, user: user).destroy_all
    else
      Like.create(post: self, user: user)
    end
  end

  def add_comment(user, contents)
    Comment.create(post: self, user: user, contents: contents)
  end
end

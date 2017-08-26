class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :profile_img, ImgUploader

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /@/
  validates :password, presence: true
  validates_length_of :password, minimum: 6

  has_many :posts
  has_many :likes
  has_many :comments
  has_many :followers, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, foreign_key: 'following_id', class_name: 'Relationship', dependent: :destroy


  def unfollow(user)
    Relationship.where(follower: self, following: user).destroy_all
  end

  def following?(user)
    Relationship.find_by(follower: self, following: user).present?
  end

  def follow_toggle(user)
    if following?(user)
      unfollow(user)
    else
      Relationship.create(follower: self, following: user)
    end
  end
end

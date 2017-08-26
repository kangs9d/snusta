class AddFollowFollowingIdToRelationShips < ActiveRecord::Migration[5.1]
  def change
    add_reference :relationships, :following, references: :users
    add_foreign_key :relationships, :users, column: :following_id
    add_reference :relationships, :follower, references: :users
    add_foreign_key :relationships, :users, column: :follower_id
  end
end

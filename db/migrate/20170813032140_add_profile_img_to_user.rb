class AddProfileImgToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_img, :text, after: :id
  end
end

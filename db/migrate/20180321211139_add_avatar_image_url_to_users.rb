class AddAvatarImageUrlToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatar_image_url, :string
  end
end

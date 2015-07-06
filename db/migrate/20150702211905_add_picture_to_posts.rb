class AddPictureToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :images, :image
  end
end

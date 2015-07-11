class AddPictureToItem < ActiveRecord::Migration
  def change
    add_column :items, :picture, :string, limit: 255
  end
end

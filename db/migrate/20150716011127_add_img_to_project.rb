class AddImgToProject < ActiveRecord::Migration
  def change
    add_column :projects, :img, :string
  end
end

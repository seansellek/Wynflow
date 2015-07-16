class AddCollabToProject < ActiveRecord::Migration
  def change
    add_column :projects, :collab, :string
  end
end

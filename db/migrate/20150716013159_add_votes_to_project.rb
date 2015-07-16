class AddVotesToProject < ActiveRecord::Migration
  def change
    add_column :projects, :votes, :integer
  end
end

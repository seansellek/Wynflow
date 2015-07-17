class VotesDefaultNil < ActiveRecord::Migration
  def change
  	change_column :projects, :votes, :integer, default: 0
  end
end

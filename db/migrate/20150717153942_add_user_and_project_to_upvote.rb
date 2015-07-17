class AddUserAndProjectToUpvote < ActiveRecord::Migration
  def change
    add_reference :upvotes, :project, index: true, foreign_key: true
    add_reference :upvotes, :user, index: true, foreign_key: true
  end
end

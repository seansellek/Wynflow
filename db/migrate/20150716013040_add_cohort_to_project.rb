class AddCohortToProject < ActiveRecord::Migration
  def change
    add_column :projects, :cohort, :integer
  end
end

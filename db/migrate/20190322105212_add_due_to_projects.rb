class AddDueToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :due, :string
  end
end

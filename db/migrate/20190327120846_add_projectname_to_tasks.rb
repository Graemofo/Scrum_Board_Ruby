class AddProjectnameToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :projectname, :string
  end
end

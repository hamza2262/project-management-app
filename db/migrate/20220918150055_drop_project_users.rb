class DropProjectUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :project_users
  end
end

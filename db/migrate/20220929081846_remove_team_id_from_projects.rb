class RemoveTeamIdFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :team_id
    add_column :teams, :project_id, :integer
  end
end

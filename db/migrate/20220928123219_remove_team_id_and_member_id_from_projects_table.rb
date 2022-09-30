class RemoveTeamIdAndMemberIdFromProjectsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :member_id
    remove_column :projects, :team_id
  end
end

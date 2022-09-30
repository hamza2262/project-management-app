class AddUserIdTeamIdMemberIdInProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :user_id, :integer
    add_column :projects, :team_id, :integer
    add_column :projects, :member_id, :integer
    add_column :projects, :title, :string
    add_column :projects, :description, :string
  end
end

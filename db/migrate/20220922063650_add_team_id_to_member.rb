class AddTeamIdToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :team_id, :integer
    add_column :members, :user_id, :integer
  end
end

class RemoveMemberIdFromTeams < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :member_id
  end
end

class AddingMemberIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :member_id, :integer
  end
end

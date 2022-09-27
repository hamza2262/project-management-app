class AddNameAndUserIdToTeam < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :name, :string
    add_column :teams, :user_id, :integer
  end
end

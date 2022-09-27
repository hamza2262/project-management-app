class DropColumnFromMemberTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :members, :member_id

  end
end

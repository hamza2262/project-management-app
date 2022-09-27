class AddingMemberAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :member_id, :integer
    add_column :members, :member_name, :string, null: false
    add_column :members, :member_email, :string, null: false
  end
end

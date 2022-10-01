class AddingMemberAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :member_id, :integer, if_not_exists: true
    add_column :members, :member_name, :string, null: false , if_not_exists: true
    add_column :members, :member_email, :string, null: false , if_not_exists: true
  end
end

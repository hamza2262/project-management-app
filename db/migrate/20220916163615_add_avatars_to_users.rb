class AddAvatarsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatars, :json
  end
end

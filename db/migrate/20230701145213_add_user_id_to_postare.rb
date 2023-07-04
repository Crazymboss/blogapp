class AddUserIdToPostare < ActiveRecord::Migration[7.0]
  def change
    add_column :postares, :user_id, :integer
    add_index :postares, :user_id
  end
end

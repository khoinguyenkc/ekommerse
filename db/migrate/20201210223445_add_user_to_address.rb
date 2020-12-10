class AddUserToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :user_id, :integer, foreign_key: true
  end
end

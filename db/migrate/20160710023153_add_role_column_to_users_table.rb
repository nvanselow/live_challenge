class AddRoleColumnToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: 'member'
  end
end

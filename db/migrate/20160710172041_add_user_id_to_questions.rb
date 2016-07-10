class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer, null: false, index: true
    add_foreign_key :questions, :users
  end
end

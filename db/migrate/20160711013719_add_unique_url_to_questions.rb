class AddUniqueUrlToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :long_id, :string, null: false
    add_index :questions, :long_id
  end
end

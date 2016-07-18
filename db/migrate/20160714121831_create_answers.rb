class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.text :body, null: false
      t.boolean :private_answer, null: false, default: false
      t.string :name

      t.timestamps null: false
    end
  end
end

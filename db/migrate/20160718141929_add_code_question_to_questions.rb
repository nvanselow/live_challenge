class AddCodeQuestionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :code_question, :boolean, null: false, default: false
  end
end

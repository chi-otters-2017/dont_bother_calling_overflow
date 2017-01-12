class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |i|
      i.string :body
      i.integer :user_id, :question_id
      i.boolean :best_answer, :default => false

      i.timestamps :null => false
    end
  end
end

class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |i|
      i.string :title,:body
      i.integer :user_id

      i.timestamps :null => false
    end
  end
end

class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |i|
      i.integer :user_id
      i.references :voteable, polymorphic: true, index: true
      i.boolean :upvote

      i.timestamps :null => false
    end
  end
end

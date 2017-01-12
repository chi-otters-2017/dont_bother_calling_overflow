class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |i|
      i.string :body
      i.integer :user_id
      i.references :commentable, polymorphic: true, index: true

      i.timestamps :null => false
    end
  end
end

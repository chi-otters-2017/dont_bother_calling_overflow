class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |i|
      i.string :user_name, :email, :hashed_password

      i.timestamps :null => false
    end
  end
end

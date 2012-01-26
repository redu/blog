class RemovePasswordFromUser < ActiveRecord::Migration
  def up
  end
  
  def change 
  	remove_column :users, :password
  end

  def down
  end
end

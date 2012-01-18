class CreatePostTagTable < ActiveRecord::Migration
  def up
    create_table :posts_tags do |t|
	  t.references :users
      t.references :tags
    end
  end

  def down
  end
end

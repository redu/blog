class CreatePostsTagsTable < ActiveRecord::Migration
  def up
    create_table :posts_tags do |t|
      t.references :post
      t.references :tag
    end
  end

  def down
  end
end

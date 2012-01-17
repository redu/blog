class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :author
      t.references :tags

      t.timestamps
    end
    add_index :posts, :author_id
    add_index :posts, :tags_id
  end
end

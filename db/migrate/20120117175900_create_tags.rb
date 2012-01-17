class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :posts

      t.timestamps
    end
    add_index :tags, :posts_id
  end
end

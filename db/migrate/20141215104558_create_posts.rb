class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :email
      t.string :location
      t.integer :category_id

      t.timestamps
    end
  end
end

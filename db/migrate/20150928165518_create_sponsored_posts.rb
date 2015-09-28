class CreateSponsoredPosts < ActiveRecord::Migration
  def change
    create_table :sponsored_posts do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.references :Topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :sponsored_posts, :Topics
  end
end

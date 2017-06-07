class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :content
      t.integer :article_ref

      t.timestamps
    end
    add_index :comments, :article_ref
  end
end

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :author, null: false, foreign_key: true
      t.string :title
      t.string :isbn, null: false, index: { unique: true }
      t.integer :publication_year

      t.timestamps
    end
  end
end

class CreateBookCopies < ActiveRecord::Migration[6.1]
  def change
    create_table :book_copies do |t|
      t.references :book, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end

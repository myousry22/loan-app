class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.float :amount
      t.integer :number_of_installments
      t.integer :duration
      t.decimal :interest, precision: 10, scale: 2
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

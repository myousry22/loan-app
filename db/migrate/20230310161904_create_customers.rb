class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.decimal :yearly_income, :precision => 8, :scale => 2
      t.string :currency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

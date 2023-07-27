class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.belongs_to :user
      t.string  :description
      t.date  :date
      t.integer :category_id
      t.decimal  :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end

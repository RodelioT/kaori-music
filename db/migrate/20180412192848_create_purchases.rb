class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.integer :purchaseUnitPrice

      t.timestamps
    end
  end
end

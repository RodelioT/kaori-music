class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :postalCode

      t.timestamps
    end
  end
end

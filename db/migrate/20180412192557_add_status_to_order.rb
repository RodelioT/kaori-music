class AddStatusToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :status, foreign_key: true
  end
end

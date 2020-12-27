class CreateCustomerEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_events do |t|
      t.references :customer, foreign_key: true
      t.references :event, foreign_key: :true
      t.timestamps
    end
  end
end

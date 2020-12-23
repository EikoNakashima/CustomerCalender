class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :title
      t.string :body
      t.datetime :start
      t.datetime :end
      t.integer :allday
      t.integer :user_id
      t.timestamps
    end
  end
end

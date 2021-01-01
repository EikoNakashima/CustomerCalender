class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name,null: false
      t.string :code
      t.string :current_address
      t.string :building_site
      t.string :phone
      t.text :body
      t.references :user, foreign_key: true,null: false
      t.timestamps
    end
  end
end

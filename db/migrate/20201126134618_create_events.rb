class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.integer :start
      t.integer :end
      t.integer :allday
      t.integer :user_id
      t.timestamps
    end
  end
end

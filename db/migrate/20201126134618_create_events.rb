class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title,null: false
      t.string :body
      t.datetime :start,null: false
      t.datetime :end,null: false
      t.references :user,foreign_key: true,null: false
      t.timestamps
    end
  end
end

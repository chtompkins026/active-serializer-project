class Comments < ActiveRecord::Migration[5.2]
  def change
      create_table :comments do |t|
        t.string :title
        t.text :description
        t.integer :user_id

        t.timestamps null: false
      end
    end
  end

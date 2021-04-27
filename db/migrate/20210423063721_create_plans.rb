class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :plan,      null: false
      t.date :date,        null: false
      t.integer :meal_id,  null: false
      t.integer :user_id,  null: false
      t.timestamps
    end
  end
end

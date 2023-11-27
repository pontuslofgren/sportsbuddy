class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.references :level, null: false, foreign_key: true
      t.date :start_date, null: false
      t.time :start_time, null: false
      t.time :duration, null: false
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.references :category, null: false, foreign_key: true
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.integer :spots
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end

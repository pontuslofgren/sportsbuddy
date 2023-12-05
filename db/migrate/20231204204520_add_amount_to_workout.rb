class AddAmountToWorkout < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :amount, :integer
  end
end

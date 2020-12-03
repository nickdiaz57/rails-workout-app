class AddTitleToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :title, :string
  end
end

class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :score
      t.belongs_to :user
      t.belongs_to :workout

      t.timestamps
    end
  end
end

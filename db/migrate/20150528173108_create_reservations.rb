class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.string :phone
      t.string :desc
      t.string :name
      t.timestamp :date

      t.timestamps null: false
    end
  end
end

class AddTypeAndServiceNameToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :type_of_vehicle, :string
    add_column :reservations, :service_name, :string
  end
end

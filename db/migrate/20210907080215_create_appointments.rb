class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :patient, foreign_key: true
      t.belongs_to :doctor, foreign_key: true
      t.string :doctor
      t.string :patient
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end

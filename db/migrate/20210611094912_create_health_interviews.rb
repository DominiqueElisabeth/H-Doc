class CreateHealthInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :health_interviews do |t|
      t.text :symptomatology
      t.text :condition
      t.text :comment
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end

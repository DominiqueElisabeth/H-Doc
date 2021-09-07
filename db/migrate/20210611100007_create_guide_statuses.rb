class CreateGuideStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :guide_statuses do |t|
      t.integer :status, default: 0, null: false
      t.references :health_interview, foreign_key: true
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end

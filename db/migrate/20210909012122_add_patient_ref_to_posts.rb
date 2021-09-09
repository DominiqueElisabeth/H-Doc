class AddPatientRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :patient, foreign_key: true
  end
end

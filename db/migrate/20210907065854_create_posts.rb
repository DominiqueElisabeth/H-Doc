class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :symptom
      t.integer :age
      t.date :dob
      t.integer :weight
      t.string :phone
      t.string :sex
      t.text :remark

      t.timestamps
    end
  end
end

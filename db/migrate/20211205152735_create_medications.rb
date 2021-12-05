class CreateMedications < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :pet_id
      t.timestamps
    end
  end
end

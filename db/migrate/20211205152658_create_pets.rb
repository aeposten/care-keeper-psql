class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image
      t.string :species
      t.string :sex
      t.string :feeding
      
      t.timestamps
    end
  end
end

class PetMedicationsSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :species, :sex, :feeding
  has_many :medications
end

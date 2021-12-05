class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :species, :sex, :feeding
end

class Pet < ApplicationRecord
    has_many :medications, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :image, presence: true, uniqueness: true
    validates  :species, presence: true
    validates :feeding, presence: true
end

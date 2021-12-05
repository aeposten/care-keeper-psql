class PetsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        pets = Pet.all
        render json: pets
    end

    def show
        pet = find_pet
        render json: pet, serializer: PetMedicationsSerializer
    end

    def create
        camper = Pet.create!(pet_params)
        render json: camper, status: :created
    end

    def update
        pet = find_pet
        pet.update(pet_params)
        render json: pet
    end

    def destroy
        activity = find_pet
        activity.destroy
        head :no_content
    end

    private

    def pet_params
        params.permit(:name, :image, :species, :sex, :feeding)
    end

    def find_pet
        Pet.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Pet not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end


end

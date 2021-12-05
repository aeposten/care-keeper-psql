class MedicationsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def show
        medication = find_medication
        render json: medication
    end

    def destroy
        medication = find_medication
        medication.destroy
        head :no_content
    end


    def update
        medication = find_medication
        medication.update(medication_params)
        render json: medication
    end

    private


    def medication_params
        params.permit(:name)
    end

    def find_medication
        Medication.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Medication not found"}, status: :not_found
    end
end

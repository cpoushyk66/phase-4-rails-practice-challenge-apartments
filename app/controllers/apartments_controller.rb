class ApartmentsController < ApplicationController
    before_action :set_apartment, only: [:show, :update, :destory]

    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

    def index
        render json: Apartment.all, status: :ok
    end

    def show
        render json: @apartment, status: :ok
    end

    def create
        render json: Apartment.create!(apartment_params), status: :created
    end

    def update
        @apartment.update(apartment_params)
        render json: @apartment, status: :accepted
    end

    def destory
        @apartment.destory
        head :no_content
    end

    private

    def set_apartment
        @apartment = Apartment.find(params[:id])
    end

    def record_invalid_error(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found_error
        render json: {error: "Apartment not found"}, status: :not_found
    end

end

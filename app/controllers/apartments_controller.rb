class ApartmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_inputs
  def index
    render json: Apartment.all, status: :ok
  end

  def show
    apartment = find_apartment
    render json: apartment, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def destroy
    apartment = find_apartment
    apartment.destroy
    head :no_content
  end

  private 
  def find_apartment
    Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:number, :id)
  end

  def record_not_found_response
    render json: { error: "Apartment Not found"}
  end

  def invalid_inputs(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end

class LeasesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_inputs

  def index
    render json: Lease.all, status: :ok
  end

  def show
    lease = find_lease
    render json: lease, status: :ok
  end

  def create
    lease = Lease.create!(lease_params)
    render json: lease, status: :created
  end

  def update
    lease = find_lease
    lease.update!(lease_params)
    render json: lease, status: :success
  end

  def destroy
    lease = find_lease
    lease.destroy
    head :no_content
  end

  private

  def find_lease
    Lease.find(params[:id])
  end

  def lease_params
    params.permit(:rent, :id, :apartment_id, :tenant_id)
  end

  def record_not_found_response
    render json: { error: 'lease Not found' }
  end

  def invalid_inputs(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end

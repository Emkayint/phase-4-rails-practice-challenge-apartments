class TenantsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_inputs

  def index
    render json: Tenant.all, status: :ok
  end

  def show
    tenant = find_tenant
    render json: tenant, status: :ok
  end

  def create
    tenant = tenant.create!(tenant_params)
    render json: tenant, status: :created
  end

  def update
    tenant = find_tenant
    tenant.update!(tenant_params)
    render json: tenant, status: :success
  end

  def destroy
    tenant = find_tenant
    tenant.destroy
    head :no_content
  end

  private

  def find_tenant
    Tenant.find(params[:id])
  end

  def tenant_params
    params.permit(:name, :id)
  end

  def record_not_found_response
    render json: { error: 'Tenant Not found' }, status: :not_found
  end

  def invalid_inputs(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end

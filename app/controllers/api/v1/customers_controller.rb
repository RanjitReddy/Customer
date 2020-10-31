class Api::V1::CustomersController < Api::V1::ApiController

  def index
    @role = Role.find_by_name('Customer')
    @customers = User.where(role_id: @role.id)
    if @customers.present?
      render json: { status: 200, customers: @customers.pluck(:user_name, :id)}
    else
      render json: { status: 400, errors: 'No Customers Found' }
    end
    rescue
      render json: { status: 400, errors: 'Some error found Try Again' }
  end

  def get_customer_age
    @customer = User.find(params[:id])
    if @customer.present?
      render json: { status: 200, dob: @customer.age(@customer.date_of_birth)}
    else
      render json: { status: 400, errors: 'No Customers Found' }
    end
    rescue
      render json: { status: 400, errors: 'Some error found Try Again' }    
  end
end
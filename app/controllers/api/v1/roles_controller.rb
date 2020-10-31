class Api::V1::RolesController < Api::V1::ApiController
  acts_as_token_authentication_handler_for User
  before_action :authenticate_user!
  before_action :set_role, only: %i[edit update destroy]
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource

  def index
    @roles = Role.all
    if @roles.present?
      render json: { status: 200, roles: @roles}
    else
      render json: { status: 200, message: 'No Roles Found' }
    end
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      render json: { status: 200, role: @role, message: 'Role created successfully' }
    else
      render json: { status: 500, errors: @role.errors }
    end
  end

  def edit; end

  def update
    if @role.update(role_params)
      render json: { status: 200, role: @role, message: 'Role updated successfully' }
    else
      render json: { status: 500, errors: @role.errors }
    end
  end

  def destroy
    @role.destroy
    render json: { status: 200, role: @role, message: 'Role deleted successfully' }
  end

  private

  def set_role
    @role = Role.find_by(id: params[:id])
    render json: { errors: { message: ['No role Found'] } } unless @role
  end

  def role_params
    params.require(:role).permit(:name, :code)
  end
end
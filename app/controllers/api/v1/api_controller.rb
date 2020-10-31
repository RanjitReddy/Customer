class Api::V1::ApiController < ActionController::Base

  rescue_from CanCan::AccessDenied do
    render json: { status: 500, errors: ['You are not authorized to do this'] }
  end  
end

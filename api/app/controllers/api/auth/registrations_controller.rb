class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :sign_up_params, only: [:create]
  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :profile_image)
  end
end

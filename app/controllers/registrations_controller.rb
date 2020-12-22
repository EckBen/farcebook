class RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:email, :first_name, :last_name, :username, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:email,
                                  :username,
                                  :first_name,
                                  :last_name,
                                  :password,
                                  :password_confirmation,
                                  :current_password,
                                  profile_attributes: [
                                    :city,
                                    :state,
                                    :job,
                                    :workplace,
                                    :profile_pic_url,
                                    :id])
    end

    protected

    def after_update_path_for(resource)
      flash[:notice] = "Profile succesfully updated."
      user_path(current_user)
    end
end
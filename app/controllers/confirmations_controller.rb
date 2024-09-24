class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      if resource.confirmation_expires_at < Time.current
        # Thông báo rằng mã xác thực đã hết hạn
        flash[:alert] = "The verification code has expired. Please register again."
        redirect_to new_user_registration_path
      else
        # Xác thực thành công
        resource.confirm
        redirect_to after_confirmation_path_for(resource_name, resource)
      end
    else
      # Xử lý lỗi
      flash[:alert] = resource.errors.full_messages.join(", ")
      redirect_to new_user_registration_path
    end
  end
end

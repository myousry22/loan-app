# frozen_string_literal: true

module Users
  # RegistrationsController
  class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(_resource)
      new_customer_path
    end
  end
end

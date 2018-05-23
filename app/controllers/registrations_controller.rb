class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      developments_path(resource)
    end
end

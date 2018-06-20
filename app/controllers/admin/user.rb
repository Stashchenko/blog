module Admin::User
  extend ActiveSupport::Concern

  included do
    def role_enum
      User::ROLES
    end
  end
end
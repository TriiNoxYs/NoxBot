module NoxBot

  # Module for permissions
  module Permissions

    def self.set!
      # Roles
      #BOT.set_role_permission(<ADMIN-ROLE-ID>, 100) # Admin => 100
      
      # Users
      BOT.set_user_permission(131218864234168321, 100) # TriiNoxYs => 100
    end
  end
end


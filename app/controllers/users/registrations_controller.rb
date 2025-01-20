class Users::RegistrationsController < Devise::RegistrationsController
    def new
        super # Appelle l'implémentation par défaut de Devise
      end
end

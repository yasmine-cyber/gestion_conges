class Users::SessionsController <  Devise::SessionsController
      # Vous pouvez personnaliser les actions ici
  def new
    super # Appelle l'implémentation par défaut de Devise
  end

  def create
    super # Appelle l'implémentation par défaut de Devise
  end

  def destroy
    super # Appelle l'implémentation par défaut de Devise
  end
end

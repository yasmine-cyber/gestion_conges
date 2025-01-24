class Users::SessionsController <  Devise::SessionsController
  include ActionController::MimeResponds
      # Vous pouvez personnaliser les actions ici
      respond_to :json
  def new
    super # Appelle l'implémentation par défaut de Devise
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: { message: 'Logged in successfully', user: resource }, status: :ok
  rescue StandardError => e
    render json: { message: 'Login failed', errors: e.message }, status: :unauthorized
  end

  def destroy
    super # Appelle l'implémentation par défaut de Devise
  end
   # Méthode pour gérer la réponse après une connexion réussie ou échouée
   def respond_with(resource, _opts = {})
   if resource.persisted?
     render json: { message: 'Logged in successfully', user: resource }, status: :ok
   else
     render json: { message: 'Login failed', errors: resource.errors.full_messages }, status: :unauthorized
   end
 end

 # Méthode pour gérer la réponse après une déconnexion
 def respond_to_on_destroy
   if current_user
     render json: { message: 'Logged out successfully' }, status: :ok
   else
     render json: { message: 'No active session' }, status: :unauthorized
   end
 end
end

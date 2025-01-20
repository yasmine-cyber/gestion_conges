class AddMissingDeviseColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
     # Colonnes pour la réinitialisation du mot de passe
     add_column :users, :reset_password_token, :string
     add_column :users, :reset_password_sent_at, :datetime
 
     # Colonnes pour "Se souvenir de moi"
     add_column :users, :remember_created_at, :datetime
 
     # Colonnes pour le suivi des connexions (optionnel)
     add_column :users, :sign_in_count, :integer, default: 0, null: false
     add_column :users, :current_sign_in_at, :datetime
     add_column :users, :last_sign_in_at, :datetime
     add_column :users, :current_sign_in_ip, :string
     add_column :users, :last_sign_in_ip, :string
 
     # Index unique pour reset_password_token
     add_index :users, :reset_password_token, unique: true

  end
end

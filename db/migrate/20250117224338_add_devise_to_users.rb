class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def change
       # Colonne pour le mot de passe chiffré (obligatoire pour Devise)
       add_column :users, :encrypted_password, :string, null: false, default: ""
       # Ajout de la contrainte d'unicité pour l'email
       add_index :users, :email, unique: true
      
  end
end

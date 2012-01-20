class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  # EMBS >> comentei a linha abaixo por conta do devise
	  # É mais simples deixar que ele crie a coluna de e-mail
	  # que editar o schema para que ele utilize a coluna já existente
	  # t.string :email
      t.string :password

      t.timestamps
    end
  end
end

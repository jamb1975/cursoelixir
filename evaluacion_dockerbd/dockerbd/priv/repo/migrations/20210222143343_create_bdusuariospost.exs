defmodule Dockerbd.Repo.Migrations.CreateBdusuariospost do
  use Ecto.Migration

  def change do
    create table(:terceros) do
      add :noident, :integer
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :dir, :string
      add :tel, :string
    end

    create table(:usuarios) do
      add :name_user, :string
      add :password, :string
      add :tercero_id, references(:terceros), null: false
      add :usuario_id, references(:usuarios), null: false

    end
    create unique_index(:usuarios, [:tercero_id]) 
  end
end  

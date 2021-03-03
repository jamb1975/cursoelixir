defmodule Redfree.Repo.Migrations.CreateBdRedFree do
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
    end
    create unique_index(:usuarios, [:tercero_id]) 

    create table(:posts) do
      add :descrip, :string
      add :fechahora, :utc_datetime
      add :usuario_id, references(:usuarios), null: false
    end

    create table(:amigos) do
      add :usuario_id, references(:usuarios), null: false
    end
    create unique_index(:amigos, [:usuario_id]) 

    create table(:usuarios_amigos) do
      add :usuario_id, references(:usuarios), null: false
      add :amigo_id, references(:amigos), null: false
    end 
    create unique_index(:usuarios_amigos, [:usuario_id, :amigo_id])
  end
end  

defmodule Dockerbd.Repo.Migrations.RemoveReferencesusuarioIdcreatetableamigosandamigosusuarios do
  use Ecto.Migration

  def change do
    alter table (:usuarios) do
      remove :usuario_id 
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

defmodule Dockerbd.Repo.Migrations.RemoveReferencesusuarioId do
  use Ecto.Migration

  def change do
    alter table (:usuarios) do
     remove :usuario_id 
     add :usuario_id, references(:usuarios)
    end
  end
end

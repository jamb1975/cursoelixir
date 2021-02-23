defmodule Dockerbd.Repo.Migrations.Removerfieldtimestamp do
  use Ecto.Migration

  def change do
    alter table (:posts) do
      remove :fechahora
      add :fechahora, :timestamptz             
    end
  end
end

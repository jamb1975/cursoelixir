defmodule Dockerbd.Repo.Migrations.RemoverfieldtimestampforutcDatetime do
  use Ecto.Migration

  def change do
    alter table (:posts) do
      remove :fechahora
      add :fechahora, :utc_datetime             
    end
  end
end

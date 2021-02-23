defmodule Dockerbd.Repo.Migrations.Altertableaddfieldtimestamp do
  use Ecto.Migration

  def change do
    alter table (:posts) do
      add :fechahora, :timestamp        
    end 
  end
end

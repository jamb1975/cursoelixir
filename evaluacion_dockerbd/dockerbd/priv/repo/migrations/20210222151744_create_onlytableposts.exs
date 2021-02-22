defmodule Dockerbd.Repo.Migrations.CreateOnlytableposts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :descrip, :string
      add :usuario_id, references(:usuarios), null: false
    end  
  end
end

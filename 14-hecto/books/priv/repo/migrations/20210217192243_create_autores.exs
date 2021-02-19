defmodule Books.Repo.Migrations.CreateAutores do
  use Ecto.Migration

  def change do
    create table(:autores) do
      add :name, :string
      add :email, :string
    end
  end
end

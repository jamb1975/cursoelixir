defmodule Books.Repo.Migrations.CreateAutoresEditorial do
  use Ecto.Migration

  def change do
    create table(:autores_editorial) do
      add :autor_id, references(:autores), null: false
      add :editorial_id, references(:editorial), null: false
    end 

    create unique_index(:autores_editorial, [:autor_id, :editorial_id])
  end
end

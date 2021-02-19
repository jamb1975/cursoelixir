defmodule Books.Repo.Migrations.CreateLibros do
  use Ecto.Migration

  def change do
    create table(:libros) do
      add :title, :string
      add :autor_id, references(:autores), null: false
    end  
  end
end

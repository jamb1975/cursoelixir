defmodule Books.Repo.Migrations.CreateEditorial do
  use Ecto.Migration

  def change do
    create table(:editorial) do
      add :name, :string
    end 
  end
end

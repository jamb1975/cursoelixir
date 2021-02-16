defmodule Books.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :author, :string
  end
  end
end

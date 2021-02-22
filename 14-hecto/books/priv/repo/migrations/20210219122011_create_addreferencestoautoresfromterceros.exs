defmodule Books.Repo.Migrations.CreateAddreferencestoautoresfromterceros do
  use Ecto.Migration

  def change do
    create table(:terceros) do
      add :dir, :string
      add :tel, :string
      add :tercero_id, references(:terceros), null: false
    end

    alter table (:autores) do
      add :tercero_id, references(:terceros) #, null: false como ya tengo registros en autores no va permitir valores null para tercero_id lo deshabilito
    end
    create unique_index(:autores, [:tercero_id])
  end
end 

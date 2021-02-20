defmodule Books.Autor do
    use Ecto.Schema
    import Ecto.Changeset
    alias Books.{Libro, Editorial, Tercero}
    schema "autores" do
      field :name #defaul string
      field :email
      belongs_to :tercero, Tercero
      has_many :libros, Libro
      many_to_many :editorial, Editorial, join_through: "autores_editorial" 
    end

    def changeset(autor, params \\ %{}) do
      autor
      |> cast(params, [:name, :email])
      |> validate_required([:name])
      |> validate_format(:email, ~r/@/)
    end
  end
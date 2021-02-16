defmodule Books.Book do
  use Ecto.Schema

  schema "books" do
    field :name, :string
    field :author, :string
  end

  def changeset(book, params \\ %{}) do
    book
    |> Ectos.Changeset.cast(params, [:name, :author])
    |> Ecto.Changeset.validate_required([:name])
  end
end

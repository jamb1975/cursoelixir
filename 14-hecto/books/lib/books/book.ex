defmodule Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :name, :string
    field :author, :string
  end

  def changeset(book, params \\ %{}) do
    book
    |> cast(params, [:name, :author])
    |> validate_required([:name])
    |> unique_constraint(:city)
  end
end

defmodule Books.Tercero do
    use Ecto.Schema
    alias Books.Tercero
    schema "terceros" do
      field :dir, :string
      field :tel, :string
      has_one :autores, Autor
    end
end    
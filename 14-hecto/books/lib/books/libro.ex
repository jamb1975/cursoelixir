defmodule Books.Libro do
    use Ecto.Schema
    alias Books.{Autor}
    schema "libros" do
      field :title, :string
      belongs_to :autor, Autor #The key foreign autor on the %{map}-> queda autor_id relacionado con autor_id de archivo de migración 
    end
  end
  

defmodule Books.Editorial do
    use Ecto.Schema
    alias Books.{Autor}
    schema "editorial" do
      field :name, :string
      many_to_many :autores, Autor, join_through: "autores_editorial"
    end
end

# Steps Create  many to many between autores  y editorial
#1. Se crea archivo migración mix ecto.gen.migration create_editorial
#2. Se crea archivo migración mix ecto.gen.migration create_autores_editorial store many to many  
#3. En el archivo migracion autores_editorial se agregan las llaves foraneas autor_id y editorial_id y se crea llave unica entre estas dos
#4. En el esquema Autor se crea la referencia foranea many to many a editorial que referencian la tabla autores_editorial
#5. Se Crea el esquema Editorial y se agrega la referencia many to many to autores que referencian la tabla autores_editorial
#5.1 se ejecuta el archivo para migrar las tablas editorial y autores_editorial mix ecto.migrate 
#6. Se crea un registro para editorial
#6.1 editorial = %Books.Editorial{name: "MacGraw Hill"}
#6.2 editorial = Books.Repo.insert!(editorial)
#7. Traemos un registro de autor o lo creamos
#7.1  autor = Books.Repo.get(Books.Autor, 1) || autor =%Books.Autor{name: "Josep Balcells"} autor = Books.Repo.insert(autor)
#8. Necesitamos estar seguros que nuestra  autor precarga los datos editorial
#8.1  autor = Books.Repo.preload(autor, [:editorial])
#9 Creamos un changeset para regitro autor
#9.1 autor_changeset = Ecto.Changeset.change(autor)
# 10. Ahora pasamos nuestro autor_changeset como argumento
#10.1 autores_editorial_changeset = autor_changeset |> Ecto.Changeset.put_assoc(:editorial, [editorial])
#11 Actualizmos para autores_editorial para crear registro de nuestro autores_editorial_changeset
#11.1 Books.Repo.update!(autores_editorial_changeset)
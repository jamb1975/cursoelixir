defmodule Dockerbd.Usuario do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias Dockerbd.{Usuario, Repo}

  schema "usuarios" do
    field :name_user# default string
    field :password
    belongs_to :tercero, Tercero
    belongs_to :usuario, Usuario
    has_many :usuarios, Usuario
    has_many :posts, Post
  end

  def changeset(usuario, params \\ %{}) do
    usuario
    |> cast(params, [:name_user, :password])
    |> validate_required([:name_user, :password])
    |> validate_length(:name_user, min: 4)
    |> validate_length(:name_user, max: 8)
    |> validate_length(:name_user, min: 10)
    |> validate_length(:password,min: 8)
    |> validate_length(:password,max: 8)
  end

  def insert_usuariotercero(usuarioasoc) do
    #csusuario = changeset(usuarioasoc)
    Repo.insert!(usuarioasoc)
  end

  def insert_usuarioamigo(mapusuario, mapusuarioamigo) do
    mapusuario = Repo.preload(mapusuario, [:usuarios])
    usuario_changeset = Ecto.Changeset.change(mapusuario)
    usuario_amigos_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:usuarios, [mapusuarioamigo])
   # changeset = changeset(mapusuario, %{usuario: mapusuarioamigo})
    #usuarioamigoasoc = Ecto.build_assoc(mapusuario, :usuario ,mapusuarioamigo)
    #csusuarioamigo = changeset(%Usuario{}, usuarioamigoasoc )
   Repo.update!(usuario_amigos_changeset)
  end
end

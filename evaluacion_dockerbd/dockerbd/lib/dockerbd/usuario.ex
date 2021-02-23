defmodule Dockerbd.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  alias Dockerbd.{Tercero, Post, Amigo, Repo}

  schema "usuarios" do
    field :name_user# default string
    field :password
    belongs_to :tercero, Tercero
    has_one :amigo, Amigo
    has_many :posts, Post
    many_to_many :amigos, Amigo, join_through: "usuarios_amigos"
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

  def insert(usuarioasoc) do
    #csusuario = changeset(usuarioasoc)
    usuario = Repo.insert!(usuarioasoc)
    amigo = %Amigo{}
    amigoasoc = Ecto.build_assoc(usuario, :amigo, amigo)
    Repo.insert!(amigoasoc)
  end

  def insert(mapusuario, mapusuarioamigo) do
    mapusuario = Repo.preload(mapusuario, [:amigos])
    usuario_changeset = Ecto.Changeset.change(mapusuario)
    usuario_amigos_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:usuarios, [mapusuarioamigo])
    Repo.update!(usuario_amigos_changeset)
  end
end

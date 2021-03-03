defmodule Redfree.Amigo do
    use Ecto.Schema
    import Ecto.Changeset
    alias Redfree.{Amigo, Usuario, Repo}
  
    schema "amigos" do
      belongs_to :usuario, Usuario
      many_to_many :usuarios, Usuario, join_through: "usuarios_amigos"
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

    def insert(usuario) do
      amigo = %Amigo{}
      amigoasoc = Ecto.build_assoc(usuario, :amigo, amigo)
      Repo.insert!(amigoasoc)
    end  
    
    def insert_usuariotercero(usuarioasoc) do
      #csusuario = changeset(usuarioasoc)
      Repo.insert!(usuarioasoc)
    end
  
    def insert_usuarioamigo(mapusuario, mapusuarioamigo) do
      mapusuario = Repo.preload(mapusuario, [:usuarios])
      usuario_changeset = Ecto.Changeset.change(mapusuario)
      usuario_amigos_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:usuarios, [mapusuarioamigo])
      Repo.update!(usuario_amigos_changeset)
    end
  end
 
defmodule Redfree.Usuarios_Amigos do
    use Ecto.Schema
    alias Redfree.{Repo, Usuario, Amigo, Usuarios_Amigos}
    
    schema "usuarios_amigos" do
        belongs_to :usuario, Usuario
        belongs_to :amigo,   Amigo
    end    
    def insert(usuarioasoc) do
      #csusuario = changeset(usuarioasoc)
      Repo.insert!(usuarioasoc)
    end
  
    def insert(mapusuario, mapamigo) do
    #   usuario = Repo.preload(mapusuario, [:amigos])
    #   usuario_changeset = Ecto.Changeset.change(usuario)
    #   usuario_amigos_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:amigos, [mapamigo])
      usuario_amigos =%Usuarios_Amigos{usuario_id: mapusuario.id, amigo_id: mapamigo.id}
      Repo.insert!(usuario_amigos)
    end
  end
 
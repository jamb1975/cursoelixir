defmodule Dockerbd.Post do
use Ecto.Schema
# import Ecto.Query
# import Ecto.Changeset
alias Dockerbd.{Usuario, Repo}

  schema "posts" do
    field :descrip #default string
    belongs_to :usuario, Usuario
  end 
  
  def insert_post(mappost) do
   #postasoc = Ecto.build_assoc(mapusuario, :posts, mappost)
   Repo.insert!(mappost)
  #  mapusuario = Repo.preload(mapusuario, [:posts])
  #  usuario_changeset = Ecto.Changeset.change(mapusuario)
  #  post_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:posts, [mappost])
  #  Repo.insert!(post_changeset)
  end  
end    
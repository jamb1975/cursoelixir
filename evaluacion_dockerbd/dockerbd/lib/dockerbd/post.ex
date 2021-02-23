defmodule Dockerbd.Post do
use Ecto.Schema
# import Ecto.Query
# import Ecto.Changeset
alias Dockerbd.{Usuario, Repo, Post}

  schema "posts" do
    field :descrip #default string
    belongs_to :usuario, Usuario
  end 
  
  def insert(mappost) do
    Repo.insert!(mappost)
   end 
  
  def insert(mappost, mapusuario) do
   # usuario = Repo.preload(mapusuario, [:posts])
    postasoc = Ecto.build_assoc(mapusuario, :posts, mappost)
    #usuario_changeset = Ecto.Changeset.change(mapusuario)
   # post_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:posts, [mappost])
    Repo.insert!(postasoc)
   end
end    
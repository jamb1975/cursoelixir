defmodule Redfree.Post do
use Ecto.Schema
# import Ecto.Query
# import Ecto.Changeset
alias Redfree.{Usuario, Repo, Post}

  schema "posts" do
    field :descrip 
    field :fechahora, :utc_datetime
    belongs_to :usuario, Usuario
  end 
  
  def insert(mappost) do
    Repo.insert!(mappost)
   end 
  
  def insert(mappost, mapusuario) do
   # usuario = Repo.preload(mapusuario, [:posts])
   # mappost.fechahora = Date.utc_today() 
    postasoc = Ecto.build_assoc(mapusuario, :posts, mappost)
    #usuario_changeset = Ecto.Changeset.change(mapusuario)
   # post_changeset = usuario_changeset |> Ecto.Changeset.put_assoc(:posts, [mappost])
    Repo.insert!(postasoc)
   end
end    
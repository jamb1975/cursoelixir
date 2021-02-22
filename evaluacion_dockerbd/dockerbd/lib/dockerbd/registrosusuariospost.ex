defmodule RegisyrosusuariosPost do
    import Ecto.Query
    alias Dockerbd.{Usuario, Post, Repo}
    def getrecords(usuario_id, lim, os) do
        usuarios = Usuario
       Repo.all(from p in Post,
          join: u in ^usuarios,
          on: [id: p.usuario_id],
          select: {u.name_user, p.descrip},  
          where: u.usuario_id == ^usuario_id, 
          order_by: [desc: p.id],
          limit: ^lim,
          offset: ^os)
     end
end
  
   
  
 
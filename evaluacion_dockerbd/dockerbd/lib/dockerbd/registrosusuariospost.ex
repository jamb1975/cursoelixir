defmodule RegisyrosusuariosPost do
    import Ecto.Query
    alias Dockerbd.{Usuario, Post, Repo, Usuarios_Amigos, Amigo}
    def getrec(usuario_id, lim, os) do
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

     def getrec2(usuario_id, lim, os) do
        #usuarios = from u in Usuario, where: [id: ^usuario_id]
        usuami = Usuarios_Amigos
        usuario = Usuario
        amigo = Amigo
        post = Post
        Repo.all(
        from ua in Usuarios_Amigos,
        join:  u in ^usuario,
        join: a in ^amigo,
        join: p in ^post,
        on: 
        u.id == ua.usuario_id and
        a.id == ua.amigo_id and
        p.usuario_id == a.usuario_id, 
        where: ua.usuario_id == ^usuario_id,
        select: {u.name_user, a.id, p.descrip},
        order_by: [desc: p.id],
        limit: ^lim,
        offset: ^os ) 
     end   
end
  
 
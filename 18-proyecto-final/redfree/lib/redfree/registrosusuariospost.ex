defmodule Redfree.RegistrosUsuariosPost do
    import Ecto.Query
    alias Redfree.{Usuario, Post, Repo, Usuarios_Amigos, Amigo}
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
     def getrec2(usuario_id, os \\ 0, lim \\ 10) do
        #usuarios = from u in Usuario, where: [id: ^usuario_id]
        usuario = Usuario
        amigo = Amigo
        post = Post
        usuaami = Usuario
        Repo.all(
        from ua in Usuarios_Amigos,
        join:  u in ^usuario,
        join: a in ^amigo,
        join: p in ^post,
        join: uam in ^usuaami,
        on: 
        u.id == ua.usuario_id and
        a.id == ua.amigo_id and
        p.usuario_id == a.usuario_id and
        uam.id == a.usuario_id, 
        where: ua.usuario_id == ^usuario_id,
        select: {p.fechahora, u.name_user, uam.name_user, a.id, p.descrip},
        order_by: [desc: p.fechahora],
        limit: ^lim,
        offset: ^os ) 
     end   
end
  
 
 alias Dockerbd.{Tercero, Usuario, Post, Amigo} 
 tercero = %Tercero{noident: 17266911, first_name: "Javier", last_name: "Murcia", email: "jm@gmail.com", tel: "3102030435", dir: "Cll 3 # 12- 65"}
 usuario = %Usuario{name_user: "jamb", password: "jamb1975"}
 tercero = %Tercero{noident: 35285711, first_name: "Carolina", last_name: "Torres", email: "jm@gmail.com", tel: "3102030435", dir: "Cll 3 # 12- 65"}
 usuario = %Usuario{name_user: "cta77", password: "jamb1975"}
 tercero = %Tercero{noident: 1222222, first_name: "Valeria", last_name: "Murcia", email: "jm@gmail.com", tel: "3102030435", dir: "Cll 3 # 12- 65"}
 usuario = %Usuario{name_user: "valeira", password: "jamb1975"}
 tercero = %Tercero{noident: 333333333, first_name: "Anamaria", last_name: "Murcia", email: "jm@gmail.com", tel: "3102030435", dir: "Cll 3 # 12- 65"}
 usuario = %Usuario{name_user: "amaria", password: "jamb1975"}
 tercero = %Tercero{noident: 11123333, first_name: "Karol", last_name: "Murcia", email: "jm@gmail.com", tel: "3102030435", dir: "Cll 3 # 12- 65"}
 usuario = %Usuario{name_user: "karol", password: "jamb1975"}
 tercero = %Tercero{noident: 234455555, first_name: "David", last_name: "Murcia", email: "jm@gmail.com", tel: "3102030435", dir: "Cll 3 # 12- 65"}
 usuario = %Usuario{name_user: "dmurcia", password: "jamb1975"}
 Tercero.insert(tercero, usuario)
 select * from  terceros;
 select * from  usuarios;
 select * from  amigos;
 usuario = Repo.get(Usuario, 7)
 Post.insert(%Post{descrip: "Evaluando"}, usuario)
usuario = Repo.get(Usuario, 7)
amigo = Repo.get(Amigo, 7)
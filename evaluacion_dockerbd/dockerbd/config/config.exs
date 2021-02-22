import Config


config :dockerbd, Dockerbd.Repo,
  database: "usuariospost",
  username: "postgres",
  password: "Jamb1975",
  hostname: "localhost"
  config :dockerbd, ecto_repos: [Dockerbd.Repo]  

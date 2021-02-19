import Config
  config :books, ecto_repos: [Books.Repo]

  config :books, Books.Repo,
  database: "books_repo",
  username: "postgres",
  password: "JAmbg172*",
  hostname: "localhost"

  

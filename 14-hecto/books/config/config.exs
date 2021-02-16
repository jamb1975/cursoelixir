import Config

config :books, Books.Repo,
  database: "books_repo",
  username: "postgres",
  password: "JAmbg172*",
  hostname: "localhost"

  config :books, ecto_repos: [Books.Repo]

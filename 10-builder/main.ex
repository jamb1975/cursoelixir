import user
user =
create_user()
|> set_name("Javier","Murcia")
|> set_country("Colombia")
|> set_languages(["spanish", "english", "francais"])
inspect(user) |> IO.puts()

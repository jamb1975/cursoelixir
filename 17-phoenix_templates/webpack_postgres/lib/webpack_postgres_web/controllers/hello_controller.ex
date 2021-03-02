defmodule WebpackPostgresWeb.HelloController do
    use WebpackPostgresWeb, :controller
    
    plug WebpackPostgresWeb.Plug.Locale, "fr"

    def index(conn, _params) do
      render(conn, "hello.html")
    end

    def show(conn, %{"messenger" => messenger}) do
      render(conn, "show.html", messenger: messenger)
    end
  end
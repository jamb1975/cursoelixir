defmodule RedfreeWeb.PageController do
  use RedfreeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

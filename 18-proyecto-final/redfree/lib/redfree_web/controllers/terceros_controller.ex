defmodule RedfreeWeb.TercerosController do
    use RedfreeWeb, :controller
    
    def index(conn, _params) do
        terceros = Redfree.Tercero.keyword_query()
        render(conn, "index.html", terceros: terceros)
    end
    
    def new(conn, _params) do
        changeset = Redfree.Tercero.changeset(%Redfree.Tercero{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"tercero" => tercero_params}) do
        noident = String.to_integer(tercero_params["noident"])
        first_name = tercero_params["first_name"]
        last_name = tercero_params["last_name"]
        email = tercero_params["email"]
        dir = tercero_params["dir"]
        tel = tercero_params["tel"]
        name_user = tercero_params["name_user"]
        password = tercero_params["password"]
        #Logger.info("#{Kernel.inspect(conn[:params]["noident"])}")
        #changeset = Redfree.Tercero.changeset(%Redfree.Tercero{}, tercero_params)
        db_handler = PostgresMock.create()
        case DbHandler.create_tercero(db_handler, %{noident: noident, first_name: first_name, last_name: last_name, email: email, dir: dir, tel: tel, name_user: name_user, password: password}) do
       # case  Redfree.Repo.insert(changeset) do
            {:ok, tercero} ->
                conn
                |> put_flash(:info, "Tercero created successfully.")
                |> redirect(to: Routes.terceros_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
          end    
    end
end

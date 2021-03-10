defmodule RedfreeWeb.UsuariosController do
    use RedfreeWeb, :controller
    
    def index(conn, _params) do
        usuarios = Redfree.Usuario.keyword_query()
        render(conn, "index.html", usuarios: usuarios)
    end
    
    def new(conn, _params) do
        changeset = Redfree.Usuario.changeset(%Redfree.Usuario{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"usuario" => usuario_params}) do
     
        changeset = Redfree.Usuario.changeset(%Redfree.Usuario{}, usuario_params)
    
        #db_handler = PostgresMock.create()
        #case DbHandler.create_tercero(db_handler, %{noident: noi, first_name: tercero_params.first_name, last_name: tercero_params.last_name, email: "c@gmail.com", dir: "cll 3", tel: "4444", name_user: tercero_params.name_user, password: tercero_params.password }) do
        case  Redfree.Repo.insert(changeset) do
            {:ok, _tercero} ->
                conn
                |> put_flash(:info, "Usuario created successfully.")
                |> redirect(to: Routes.usuarios_path(conn, :index))
            {:error, changeset} ->
                render(conn, "new.html", changeset: changeset)
          end    
    end
end

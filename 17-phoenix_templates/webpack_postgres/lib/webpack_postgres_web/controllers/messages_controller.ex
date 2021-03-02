defmodule WebpackPostgresWeb.MessageController do
    use WebpackPostgresWeb, :controller
  
    # def show(conn, params) do
    #   case Authenticator.find_user(conn) do
    #     {:ok, user} ->
    #       case find_message(params["id"]) do
    #         nil ->
    #           conn |> put_flash(:info, "That message wasn't found") |> redirect(to: "/")
    #         message ->
    #           if Authorizer.can_access?(user, message) do
    #             render(conn, :show, page: message)
    #           else
    #             conn |> put_flash(:info, "You can't access that page") |> redirect(to: "/")
    #           end
    #       end
    #     :error ->
    #       conn |> put_flash(:info, "You must be logged in") |> redirect(to: "/")
    #   end
    # end

    ##########################################################

    # plug :authenticate
    # plug :fetch_message
    # plug :authorize_message
  
    # def show(conn, params) do
    #   render(conn, :show, page: conn.assigns[:message])
    # end
  
    # defp authenticate(conn, _) do
    #   case Authenticator.find_user(conn) do
    #     {:ok, user} ->
    #       assign(conn, :user, user)
    #     :error ->
    #       conn |> put_flash(:info, "You must be logged in") |> redirect(to: "/") |> halt()
    #   end
    # end
  
    # defp fetch_message(conn, _) do
    #   case find_message(conn.params["id"]) do
    #     nil ->
    #       conn |> put_flash(:info, "That message wasn't found") |> redirect(to: "/") |> halt()
    #     message ->
    #       assign(conn, :message, message)
    #   end
  end
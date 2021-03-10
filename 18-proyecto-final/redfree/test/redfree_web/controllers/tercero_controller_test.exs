defmodule RedfreeWeb.TerceroControllerTest do
  use RedfreeWeb.ConnCase

  alias Redfree.Accounts

  @create_attrs %{dir: "some dir", emai: "some emai", first_name: "some first_name", last_name: "some last_name", noident: 42, tel: "some tel"}
  @update_attrs %{dir: "some updated dir", emai: "some updated emai", first_name: "some updated first_name", last_name: "some updated last_name", noident: 43, tel: "some updated tel"}
  @invalid_attrs %{dir: nil, emai: nil, first_name: nil, last_name: nil, noident: nil, tel: nil}

  def fixture(:tercero) do
    {:ok, tercero} = Accounts.create_tercero(@create_attrs)
    tercero
  end

  describe "index" do
    test "lists all terceros", %{conn: conn} do
      conn = get(conn, Routes.tercero_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Terceros"
    end
  end

  describe "new tercero" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.tercero_path(conn, :new))
      assert html_response(conn, 200) =~ "New Tercero"
    end
  end

  describe "create tercero" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tercero_path(conn, :create), tercero: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.tercero_path(conn, :show, id)

      conn = get(conn, Routes.tercero_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Tercero"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tercero_path(conn, :create), tercero: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tercero"
    end
  end

  describe "edit tercero" do
    setup [:create_tercero]

    test "renders form for editing chosen tercero", %{conn: conn, tercero: tercero} do
      conn = get(conn, Routes.tercero_path(conn, :edit, tercero))
      assert html_response(conn, 200) =~ "Edit Tercero"
    end
  end

  describe "update tercero" do
    setup [:create_tercero]

    test "redirects when data is valid", %{conn: conn, tercero: tercero} do
      conn = put(conn, Routes.tercero_path(conn, :update, tercero), tercero: @update_attrs)
      assert redirected_to(conn) == Routes.tercero_path(conn, :show, tercero)

      conn = get(conn, Routes.tercero_path(conn, :show, tercero))
      assert html_response(conn, 200) =~ "some updated dir"
    end

    test "renders errors when data is invalid", %{conn: conn, tercero: tercero} do
      conn = put(conn, Routes.tercero_path(conn, :update, tercero), tercero: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tercero"
    end
  end

  describe "delete tercero" do
    setup [:create_tercero]

    test "deletes chosen tercero", %{conn: conn, tercero: tercero} do
      conn = delete(conn, Routes.tercero_path(conn, :delete, tercero))
      assert redirected_to(conn) == Routes.tercero_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.tercero_path(conn, :show, tercero))
      end
    end
  end

  defp create_tercero(_) do
    tercero = fixture(:tercero)
    %{tercero: tercero}
  end
end

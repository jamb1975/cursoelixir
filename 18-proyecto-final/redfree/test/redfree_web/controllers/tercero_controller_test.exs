defmodule RedfreeWeb.TerceroControllerTest do
  use ExUnit.Case, async: true
  use Plug.Test
    doctest TerceroRepo
    Ecto.Adapters.SQL.Sandbox.mode(Redfree.Repo, {:shared, self()})
    test "creatiUse RepoImpl2 as struc" do
      db_handler =PostgresMock.create()
      # tercero_repo = TerceroRepoImpl2.create(db_handler)
      # db_handler =PostgresMock.create()
      # tercero_repo = TerceroRepoImpl.start_link(db_handler)
          
      assert DbHandler.create_tercero(db_handler, %{noident: 1, first_name: "David", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "11111111111", name_user: "dmurcia", password: "password"}) == %{noident: 1, first_name: "David", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "11111111111", name_user: "dmurcia", password: "password"}
      assert DbHandler.create_tercero(db_handler, %{noident: 2, first_name: "Karol", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "21111111111", name_user: "kmurcia", password: "password"}) == %{noident: 2, first_name: "Karol", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "21111111111", name_user: "kmurcia", password: "password"}
      assert DbHandler.create_tercero(db_handler, %{noident: 3, first_name: "Anamaria", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "31111111111", name_user: "amurcia", password: "password"}) == %{noident: 3, first_name: "Anamaria", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "31111111111", name_user: "amurcia", password: "password"}
      assert DbHandler.create_tercero(db_handler, %{noident: 4, first_name: "Valeria", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "41111111111", name_user: "vmurcia", password: "password"}) == %{noident: 4, first_name: "Valeria", last_name: "Murcia", email: "d@gmail.com", dir: "cll 3", tel: "41111111111", name_user: "vmurcia", password: "password"}    
    end
  end 
defmodule PostgresMockTest do
  use ExUnit.Case
  doctest PostgresMock

  test "Create a Postgremock pid" do
    db_handler = %PostgresMock{}
    assert db_handler.pid == nil
  end
  
  test "Create a Postgremock" do
    db_handler = %PostgresMock{}
    assert db_handler.pid == nil
  end

  test "Create a user" do
    db_handler =PostgresMock.create()
    expected = %User{id: 1, name: "Karol"}
    new_user = DbHandler.create_tercero(db_handler, %{noident: "35285711", first_name: "Carolina", last_name: "Torres", email: "c@gmail.com", dir: "cll 3", tel: "4444", name_user: "ctorres", password: "123" })
    assert expected == new_user
  end

  test "finding a user" do
    db_handler =PostgresMock.create()
    DbHandler.create_user(db_handler, %{name: "Valeria"})
    DbHandler.create_user(db_handler, %{name: "Anamaria"})
     
    assert DbHandler.find_user(db_handler, 0) == nil
    assert DbHandler.find_user(db_handler, 1) == %User{id: 1, name: "Valeria"}
    assert DbHandler.find_user(db_handler, 2) == %User{id: 2, name: "Anamaria"}
    assert DbHandler.find_user(db_handler, 3) == nil
  end
end
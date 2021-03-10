defmodule Redfree.AccountsTest do
  use Redfree.DataCase

  alias Redfree.Accounts

  describe "terceros" do
    alias Redfree.Accounts.Tercero

    @valid_attrs %{dir: "some dir", emai: "some emai", first_name: "some first_name", last_name: "some last_name", noident: 42, tel: "some tel"}
    @update_attrs %{dir: "some updated dir", emai: "some updated emai", first_name: "some updated first_name", last_name: "some updated last_name", noident: 43, tel: "some updated tel"}
    @invalid_attrs %{dir: nil, emai: nil, first_name: nil, last_name: nil, noident: nil, tel: nil}

    def tercero_fixture(attrs \\ %{}) do
      {:ok, tercero} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_tercero()

      tercero
    end

    test "list_terceros/0 returns all terceros" do
      tercero = tercero_fixture()
      assert Accounts.list_terceros() == [tercero]
    end

    test "get_tercero!/1 returns the tercero with given id" do
      tercero = tercero_fixture()
      assert Accounts.get_tercero!(tercero.id) == tercero
    end

    test "create_tercero/1 with valid data creates a tercero" do
      assert {:ok, %Tercero{} = tercero} = Accounts.create_tercero(@valid_attrs)
      assert tercero.dir == "some dir"
      assert tercero.emai == "some emai"
      assert tercero.first_name == "some first_name"
      assert tercero.last_name == "some last_name"
      assert tercero.noident == 42
      assert tercero.tel == "some tel"
    end

    test "create_tercero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_tercero(@invalid_attrs)
    end

    test "update_tercero/2 with valid data updates the tercero" do
      tercero = tercero_fixture()
      assert {:ok, %Tercero{} = tercero} = Accounts.update_tercero(tercero, @update_attrs)
      assert tercero.dir == "some updated dir"
      assert tercero.emai == "some updated emai"
      assert tercero.first_name == "some updated first_name"
      assert tercero.last_name == "some updated last_name"
      assert tercero.noident == 43
      assert tercero.tel == "some updated tel"
    end

    test "update_tercero/2 with invalid data returns error changeset" do
      tercero = tercero_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_tercero(tercero, @invalid_attrs)
      assert tercero == Accounts.get_tercero!(tercero.id)
    end

    test "delete_tercero/1 deletes the tercero" do
      tercero = tercero_fixture()
      assert {:ok, %Tercero{}} = Accounts.delete_tercero(tercero)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_tercero!(tercero.id) end
    end

    test "change_tercero/1 returns a tercero changeset" do
      tercero = tercero_fixture()
      assert %Ecto.Changeset{} = Accounts.change_tercero(tercero)
    end
  end
end

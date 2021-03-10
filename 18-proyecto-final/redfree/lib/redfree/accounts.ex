defmodule Redfree.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Redfree.Repo

  alias Redfree.Accounts.Tercero

  @doc """
  Returns the list of terceros.

  ## Examples

      iex> list_terceros()
      [%Tercero{}, ...]

  """
  def list_terceros do
    Repo.all(Tercero)
  end

  @doc """
  Gets a single tercero.

  Raises `Ecto.NoResultsError` if the Tercero does not exist.

  ## Examples

      iex> get_tercero!(123)
      %Tercero{}

      iex> get_tercero!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tercero!(id), do: Repo.get!(Tercero, id)

  @doc """
  Creates a tercero.

  ## Examples

      iex> create_tercero(%{field: value})
      {:ok, %Tercero{}}

      iex> create_tercero(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tercero(attrs \\ %{}) do
    %Tercero{}
    |> Tercero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tercero.

  ## Examples

      iex> update_tercero(tercero, %{field: new_value})
      {:ok, %Tercero{}}

      iex> update_tercero(tercero, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tercero(%Tercero{} = tercero, attrs) do
    tercero
    |> Tercero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tercero.

  ## Examples

      iex> delete_tercero(tercero)
      {:ok, %Tercero{}}

      iex> delete_tercero(tercero)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tercero(%Tercero{} = tercero) do
    Repo.delete(tercero)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tercero changes.

  ## Examples

      iex> change_tercero(tercero)
      %Ecto.Changeset{data: %Tercero{}}

  """
  def change_tercero(%Tercero{} = tercero, attrs \\ %{}) do
    Tercero.changeset(tercero, attrs)
  end
end

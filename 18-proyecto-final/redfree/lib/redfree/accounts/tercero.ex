defmodule Redfree.Accounts.Tercero do
  use Ecto.Schema
  import Ecto.Changeset

  schema "terceros" do
    field :dir, :string
    field :emai, :string
    field :first_name, :string
    field :last_name, :string
    field :noident, :integer
    field :tel, :string

    timestamps()
  end

  @doc false
  def changeset(tercero, attrs) do
    tercero
    |> cast(attrs, [:noident, :first_name, :last_name, :emai, :dir, :tel])
    |> validate_required([:noident, :first_name, :last_name, :emai, :dir, :tel])
  end
end

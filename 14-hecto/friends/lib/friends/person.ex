defmodule Friends.Person do
  use Ecto.Schema

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :age, :integer
  end

  def changeset(person, params \\ %{}) do
    person
    |> Ecto.Changeset.cast(params, [:first_name, :last_name, :email, :age])
    |> Ecto.Changeset.validate_required([:first_name, :last_name])
  end
end

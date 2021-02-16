defmodule Books.Weather do
  use Ecto.Schema
  import Ecto.Query
  alias Books.{Weather, Repo}
      schema "weathers" do
      field :city     # Defaults to type :string
      field :temp_lo, :integer
      field :temp_hi, :integer
      field :prcp,    :float, default: 0.0
    end

   def changeset(weather, params \\ %{}) do
    weather
    |> Ectos.Changeset.cast(params, [:city, :temp_lo, :temp_hi])
    |> Ecto.Changeset.validate_required([:city])
   end

   def keyword_query do
    query =
      from w in Weather,
           where: w.prcp > 0 or is_nil(w.prcp),
           select: w

    Repo.all(query)
  end

  def pipe_query do
    Weather
    |> where(city: "Villanueva")
    |> order_by(:temp_lo)
    |> limit(10)
    |> Repo.all
  end
end

defmodule Books.Weather do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias Books.{Weather, Repo}

  schema "weathers" do
    field :city     # Defaults to type :string
    field :temp_lo, :integer
    field :temp_hi, :integer
    field :prcp,    :float, default: 0.0
  end

   def changeset(weather, params \\ %{}) do
    weather
    |> cast(params, [:city, :temp_lo, :temp_hi, :prcp])
    |> validate_required([:city])
   end

   def keyword_query do
    query =
      from w in Weather,
           where: w.prcp > 0.0 or is_nil(w.prcp),
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

  def insert_weather(mapweather) do
    weather = %Weather{}
    cs = changeset(weather, mapweather )
    Repo.insert(cs)
  end  
  
  def update_weather_by_id(id, mapweather) do
    weather = Repo.get(Weather, id)
    cs = changeset(weather,mapweather)
    Repo.update(cs)
  end  
end

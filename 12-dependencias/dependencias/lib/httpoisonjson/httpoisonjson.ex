defmodule HttPoisonJson do
  def gethttp(url, limit, offset \\ nil)
  do

   url =url <> "?limit=#{limit}"
   url = if offset != nil, do: url <> "&offset=#{offset}", else: url

      case HTTPoison.get("https://pokeapi.co/api/v2/pokemon") do
        {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
          {_, data}= JSON.decode(body)
          data["results"]
          {:error, _} -> nil
      end
  end

  def gethttp2withparams(url, limit, offset \\ nil)
  do
    url =url <> "?limit=#{limit}"
    url = if offset !=nil, do: url <> "&offset=#{offset}"
   case HTTPoison.get(url) do
     {:ok, %HTTPoison.Response{body: body}} ->
      {_, data}= JSON.decode(body)
      data["results"]

      {:error, _} -> nil
   end
  end

end
  #HTTPoison.start
  #HttPoisonJson.gethttp("http://httparrot.herokuapp.com/get")
  HttPoisonJson.gethttp("https://pokeapi.co/api/v2/pokemon", 20) |> IO.inspect()

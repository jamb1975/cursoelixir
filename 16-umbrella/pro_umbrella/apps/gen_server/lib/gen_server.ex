defmodule GENServer do
  def inicio() do
    {:ok, observer} = GenServerObserver.create(0)
  end
end

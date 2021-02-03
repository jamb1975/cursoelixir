defmodule MyMapReduce do

def double(list) when is_list(list), do: map(list, &(2* &1))
def sum(list) when is_list(list), do: reduce(list, 0, &(&1 + &2))

defp doublep([], acc), do: acc
defp doublep([h | t], acc), do: doublep(t, acc ++ [2 * h])

def map(list, transform) when is_list(list) and is_function(transform, 1) do
  #mapp(list, [], transform)
  reduce(list, [], fn h, acc-> acc ++ [transform.(h)]  end)
end
def filter(list, condition), do: reduce(list, [], &(if condition.(&1), do: &2 ++ [&1], else: &2))

  # fn n, acc->
  #    case condition.(n) do
  #     # true -> acc ++ [n]
  #     false -> acc
  #   end

  # end)


def reduce(list, acc, action) when is_list(list) and is_function(action, 2) do
  reducep(list, acc, action)
end
#defp mapp([], acc, _), do: acc
#defp mapp([h | t], acc, transform), do: mapp(t, acc ++[transform.(h)], transform)
defp reducep([], acc, _), do: acc
defp reducep([h | t], acc, action), do: reducep(t, action.(h, acc), action)

end
IO.inspect Enum.map(MyMapReduce.filter([1, 2, 3, 4, 5, 6, 7],&(rem(&1,2)==1)), &(3 * &1 + 1))

defmodule PrintOneZeroReduce do
  def printonezeroreduce(n) when is_integer(n), do: printonezeroreducep(n,0, "1", &(&1 - &2))
  defp printonezeroreducep(0, _, s, _), do: s
  defp printonezeroreducep(n, acc, s, action) do
    IO.puts(s)
    printonezeroreducep(n-1,action.(1, acc),"#{acc}" <> "#{s}", action )
  end
end
PrintOneZeroReduce.printonezeroreduce(10)

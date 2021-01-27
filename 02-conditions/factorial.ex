defmodule Factorial do
  def fac(n) do
    cond do

        n>1->n * fac(n-1)
        n>=0->1
        true->1 #Needed when the rest of cases are false
      end
    end
  end


IO.puts Factorial.fac(6)

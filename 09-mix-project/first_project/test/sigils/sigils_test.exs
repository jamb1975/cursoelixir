defmodule SigilTest do
  use ExUnit.Case
  doctest Sigil

  test "sigil" do
  import Sigil, only: [sigil_i: 2]
    assert ~i[7] == 7
    assert ~i[7]n == -7
    assert ~i[7]a == 7
   end
end

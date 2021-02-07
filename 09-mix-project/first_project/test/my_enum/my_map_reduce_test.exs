defmodule MyMapReduceTest do
  use ExUnit.Case
  doctest MyMapReduce

  test "doubles each element in a list" do
    import MyMapReduce, only: [double: 1]
    assert_raise FunctionClauseError, fn ->
        double(2)
    end
    assert double([]) == []
    assert double([1]) == [2]
    assert double([1, 3, 5, 6]) == [2, 6, 10, 12]
  end


  test "sum each element in a list" do
    import MyMapReduce, only: [sum: 1]
    assert_raise FunctionClauseError, fn ->
        sum(1)
    end
    assert sum([]) == 0
    assert sum([1]) == 1
    assert sum([1, 3, 5, 6]) == 15
  end

  test "filter each element in a list" do
    import MyMapReduce, only: [filter: 2]
    assert_raise FunctionClauseError, fn ->
        filter(1, 1)
    end
    assert_raise FunctionClauseError, fn ->
      filter(1, 1)
    end
    assert filter([1, 2, 3, 4, 5, 6, 7], &(rem(&1,2)==1)) == [1, 3, 5, 7]
    assert filter([1],&(rem(&1,2)==1)) == [1]
  end
end

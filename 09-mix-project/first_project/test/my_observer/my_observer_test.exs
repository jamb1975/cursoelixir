defmodule MyObserverTest do
  use ExUnit.Case
  doctest MyObserver

  test "create observer" do

    subject  = MyObserver.create()
    assert MyObserver.read(subject) == 0

    subject = MyObserver.create(0)
    assert MyObserver.read(subject) == 0

    subject = MyObserver.create(1)
    assert MyObserver.read(subject) == 1

  end

  test "attach, increment and notify" do

    subject = MyObserver.create()

    MyObserver.increment(subject)
    assert MyObserver.await() == :timeout

    MyObserver.attach(subject)
    MyObserver.increment(subject)
    #assert MyObserver.await() == 2
    #https://hexdocs.pm/ex_unit/ExUnit.Assertions.html

    assert_receive 2
    MyObserver.detach(subject)
    MyObserver.increment(subject)
    assert MyObserver.await() == :timeout
  end

  test "attach, detach decrement and notify" do

    subject=MyObserver.create(5)
    assert MyObserver.decrement(subject)
    assert MyObserver.await() == :timeout

    MyObserver.attach(subject)
    MyObserver.decrement(subject)
    assert MyObserver.await() == 3

    MyObserver.detach(subject)
    MyObserver.decrement(subject)
    assert MyObserver.await() == :timeout
  end


end

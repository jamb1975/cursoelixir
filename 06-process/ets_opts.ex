table = :ets.new(:my_bucket, [:set, :protected]) #reference
:ets.insert(table, {"key", 1}) #true
:ets.insert(table, {"key", 2}) #true
:ets.insert(table, {"key", 3}) #true
:ets.insert(table, {"key", 4}) #true
:ets.insert(table, {"key", 5}) #true
:ets.lookup(table,"key") # [{"a", 1}, {"a", 2}, , {"a", 3}, , {"a", 4}, , {"a", 5}]
:ets.insert(table, {"key", 1}) #true
:ets.lookup(table,"key") # [{"a", 1}, {"a", 2}, , {"a", 3}, , {"a", 4}, , {"a", 5}]
:ets.insert(table, {"key", 7}) #true
:ets.lookup(table,"key") # [{"a", 1}, {"a", 2}, , {"a", 3}, , {"a", 4},  {"a", 5}, {"a", 7}, ]

##########################################
table = :ets.new(:my_bucket,[:bag, :protected]) #reference
:ets.insert(table, {"key", 1}) #true
:ets.insert(table, {"key", 2}) #true
:ets.insert(table, {"key", 3}) #true
:ets.insert(table, {"key", 4}) #true
:ets.insert(table, {"key", 5}) #true
:ets.lookup(table,"key") # [{"a", 1}, {"a", 2}, , {"a", 3}, , {"a", 4}, , {"a", 5}]
:ets.insert(table, {"key", 1}) #true
:ets.lookup(table,"key") # [{"a", 1}, {"a", 2}, , {"a", 3}, , {"a", 4}, , {"a", 5}]
:ets.insert(table, {"key", 7}) #true
:ets.lookup(table,"key") # [{"a", 1}, {"a", 2}, , {"a", 3}, , {"a", 4},  {"a", 5}, {"a", 7}, ]

##################################################

table1 = :ets.new(:my_bucket,[:bag, :protected]) #reference
:ets.insert(table, {:hello, 1}) #true
:ets.insert(table, {:hello, 2}) #true
:ets.insert(table, {:hello, 3}) #true
:ets.insert(table1, {:hello, 4}) #true
:ets.insert(table1, {:hello, 5}) #true
:ets.lookup(table1,:hello) # [{:hello, 1}, {:hello, 2}, , {:hello, 3}, {:hello, 4}, {:hello, 5}]
:ets.insert(table1, {:hello, 1}) #true
:ets.lookup(table1,:hello) # [{"a", 1}, {:hello, 2}, , {:hello, 3}, {:hello, 4}, {:hello, 5}]
:ets.insert(table1, {:hello, 7}) #true
:ets.lookup(table1,:hello) # [{"a", 1}, {:hello, 2}, , {:hello, 3}, {:hello, 4}, {:hello, 5}, {:hello, 7}]
spawn_link fn -> :ets.lookup(table1, :hello)end #PID<0.115.0>
parent = self() #PID<0.102.0>
spawn_link fn ->send parent, :ets.lookup(table1, :hello)end #PID<0.118.0>
receive do
  x -> x
end #[{"a", 1}, {:hello, 2}, , {:hello, 3}, {:hello, 4}, {:hello, 5}, {:hello, 7}]#
spawn_link fn ->send parent, :ets.insert(table1, {:hello, 7})end #throws Argument error, cant insert  table1 is protected

############################
table1 = :ets.new(:my_bucket,[:bag, :private]) #reference
parent = self() #PID<0.124.0>
spawn_link fn ->send parent, :ets.lookup(table1, "key")end #throws Argument error, cant lookup table1 is private

await = fn ->
receive do
  {:hello, msg} -> msg
  {:bye, msg} -> msg <> " " <> msg
  {:pid, pid}  -> pid
end
end

await2 = fn ->
receive do
  {:hello, msg} -> msg
  {:bye, msg} -> msg <> " " <> msg
  {:pid, pid}  -> pid
  _ -> {:error, "there wasnt a match"}
end
end

await3 = fn millis ->
  receive do
    {:hello, msg} -> msg
    {:bye, msg} -> msg <> " " <> msg
    {:pid, pid} -> pid
  after
    millis -> "Timeout after #{millis} milliseconds"
  end
  end

  test = fn await ->
           send self(), {:hello, "World"}
           IO.puts await.() # world
           send self(), {:bye, "bye"}
           IO.puts await.() #" bye bye"
           send self(), {:hi, "?"}
           IO.inspect await.() # will
        end

    test.(await2)
    #world
    #bye
    # {:error, "there wasn't a match"}

    test.(fn -> await3.(1000) end)
    #world
    #bye bye
    # after 1000 milliseconds: Timeout!

    IO.puts "=============================="
    self_pid = self()
    pid = spawn fn ->
                 spid = self()
                 send self_pid, {:pid, spid}
                end
    second_pid = await3.(1000) #process id of the spawn
    IO.puts pid === second_pid

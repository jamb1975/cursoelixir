defmodule Sigil do
  def example1 do
    regex = ~r/foo|baz/
    IO.puts "foo" =~ regex #true
    IO.puts "bar" =~ regex #false
    "HELLO" =~ ~r/hello/ # false
    "HELLO" =~ ~r/hello/i # true
  end

  def example2 do
    IO.puts ~r/hello/
    IO.puts ~r|hello|
    IO.puts ~r"hello"
    IO.puts ~r{hello}
    IO.puts ~r[hello]
    IO.puts ~r(hello)
    IO.puts ~r<hello>
    IO.puts ~r<^https?://>
    IO.puts ~r'hello'
  end
  def parse_url do
    url="http://www.google.com"
    regex_url_1 = ~r<^https?://>
    regex_url_2 = ~r/^https?:\/\//
    IO.puts regex_url_1 === regex_url_2 #true
    IO.puts url =~ regex_url_1
  end

  def string_sigils do
    IO.puts "Hello"
    #IO.puts ~s(Hello #{name})
    IO.puts ~S(Hello #{name})

    IO.puts "Frank"
    #IO.puts ~s(Hello #{name})
    IO.puts ~S(Hello #{name})

  end

  def charlist_sigils do
    IO.puts  'hello'
    IO.puts ~c(hello)
  end

  def calendar_sigils do
    date = ~D[2021-02-04]
    date2 = %Date{year: 2021, month: 2, day: 4}
    IO.puts date === date2

    t = ~T[14:31:53.0]
    t2 = ~T[14:31:53]
    t3 = %Time{hour: 14, minute: 31, second: 53}
    IO.puts t === t2 #false
    IO.puts t2 === t3 #true


    ndt = ~N[2021-02-04 14:31:53.0]
    IO.inspect Map.keys(ndt)
    IO.inspect Map.values(ndt)

    dt = ~U[2021-02-05 14:31:53Z]
    %DateTime{minute: m, time_zone: tz, utc_offset: uo, std_offset: so} = dt
    IO.puts(m)
    IO.puts(tz)
    IO.puts(uo)
    IO.puts(so)

  end

  def sigil_i(string, []), do: String.to_integer(string)
  def sigil_i(string, [?n]), do: -String.to_integer(string)
  def sigil_i(string, [?a]), do: string |> String.to_integer() |> abs()
end

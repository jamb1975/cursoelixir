string = "Hello"
IO.puts string
IO.puts is_binary(true) #true
IO.puts "@" #64
IO.puts "@" == 64 # true
IO.puts "@" == 0x40 # true
IO.puts "\u0061" # a
IO.puts "\u0061" ==  "a"
IO.puts "\u0061" ==="a" # true
IO.puts "\u0061" ==="a" # true

#############################
string = "Pingúino"
IO.puts string
IO.puts String.length(string)
IO.puts byte_size(string) # true<<<>>>> # true
############################################
#7 6 5 4 3 2 1 0
#a b c d e f g h= 2^7
#0 0 0 0 0 0 0 0
#1 1 1 1 1 1 1 1
#255=0b1111_1111
#256= 0b100_0000_0000

IO.puts <<256::8>> == <<0::8>>#true
IO.puts <<0>> == <<0::8>>#true

IO.puts <<0::8>> === <<1::0>>#true
IO.puts <<256::16>> === <<1::8, 0::8>>#true
IO.puts <<64>> ==="@"#true
IO.puts <<4::4, 0::4>> ==="@"#true
IO.puts <<64>> ==="@"
IO.puts <<1::1, 0::1, 1::1, 1::1>> === <<11::4>>


###############################
IO.puts is_bitstring(<<11::4>>) #true
IO.puts is_binary(<<11::4>>) #false
IO.puts is_binary(<<11::8>>) #true
##########################
<<1, 2, x, y>>= <<1, 2, 3, 4>>#" x= 3 and y =4"
IO.puts x
IO.puts y
#<<1, 2, x>>= <<1, 2, 3, 4>> # thtows a matcherror
<<1, 2, x::binary>> = <<1, 2, 3, 4, 5, 6, 7>># x= <<3, 4, 5, 6, 7>>
IO.puts x
###########################################
<<a::size(2), b::size(2)>> = <<11::4>>
IO.puts a
IO.puts b
<<head::binary-size(2), middle, tail::binary>> =<<64, 65, 66, 67, 98, 69>>
 IO.puts head #"@A, ,
 IO.puts middle #66
 IO.puts tail #"CDE"

 #################
 IO.puts is_binary(<<219, 197, 19>>)#true
 IO.puts String.valid?(<<219, 197, 19>>) #false
 IO.puts String.valid?(<<127>>)#true
 IO.puts String.valid?(<<128>>)#false
 ########################################
 <<head, rest::binary>> = "Microsoft"
 IO.puts head == ?M # t, rue
 IO.puts head # 77
 IO.inspect rest # "icrosoft"

 <<head, rest::binary>> = "ûber"
 IO.puts head  # 195
 IO.inspect rest # <<188, 98, 101, 114>>


 <<head::binary-size(2), rest::binary>> = "ûber"
 IO.puts "head 1 #{head}"  # û
 IO.puts "head 2 #{head}" #77

 IO.puts rest # ber

 ####################
 IO.inspect 'Hola', charlists: :as_lists

 n = 1..5 * 3 + 1 #new list solo tenga multiplos de 2
 IO.inspect n
IO.inspect Enum.map([1, 2, 3, 4, 5], &(3 * &1 + 1))
IO.inspect Enum.reduce([1, 2, 3, -1], 0, fn act, acc -> act + acc end)
list=[1, 2, 3, 4, 5]
IO.inspect triple_plus_one=Enum.map(list, &(3 * &1 + 1) )
IO.inspect Enum.filter(triple_plus_one, &(rem(&1,2) == 1))
IO.inspect Enum.map(Enum.filter(list, &(rem(&1,2) == 1)),  &(&1 * 3 + 1))

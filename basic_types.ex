n=102
n_hex=0x41 #=65
n_octal=0o24 #=20
IO.puts("a=#{n}, b= #{n_hex}, c=#{n_octal}")
x=2.71
IO.puts("round #{x} =#{round(x)}")
IO.puts("trunc #{x} =#{trunc(x)}")
x=276.5e-2
IO.puts("round #{x} =#{round(x)}")
IO.puts("trunc #{x} =#{trunc(x)}")
isOpen=true #false
#Numbers (Integers and Floats)

IO.puts "(1==1.0)=#{1==1.0}"
IO.puts "(1!=1.0)=#{1!=1.0}"
IO.puts "(1===1.0)=#{1===1.0}"
IO.puts "(1!==1.0)=#{1!==1.0}"
IO.puts "(1.0<2)=#{1.0<2}"
IO.puts "(1.0<=2)=#{1.0<=2}"
IO.puts "(2.0<=2)=#{2.0<=2}"
IO.puts "(1.0>2)=#{1.0>2}"
IO.puts "(1.0>=2)=#{1.0>=2}"
IO.puts "(2.0>=2)=#{1>=2}"
t=true
f=false
IO.puts(" N AND")
IO.puts("#{f} and #{f}= #{f and f}")
IO.puts("#{t} and #{f}= #{t and f}")
IO.puts("#{t} and #{t}= #{t and t}")
IO.puts(" N OR")
IO.puts("#{f} or #{f}= #{f or f}")
IO.puts("#{t} or #{f}= #{t or f}")
IO.puts("#{t} or #{t}= #{t or t}")

IO.puts(" N NOT")
IO.puts(" Not #{f} = #{ not f}")
IO.puts(" Not #{t} = #{ not t}")
 x=2
 f=2.75
 t=true
 IO.puts(" N Is boolean, is integer, is float, is number")
 IO.puts(" variable  boolean");
 IO.puts(" Is boolean #{t} = #{is_boolean(t)}")
 IO.puts(" Is Integer #{t} = #{is_integer(t)}")
 IO.puts(" Is float #{t} =   #{is_float(t)}")
 IO.puts(" Is number #{t} = #{is_number(t)}")

 IO.puts("variable integer");
 IO.puts(" Is boolean #{x} = #{is_boolean(x)}")
 IO.puts(" Is Integer #{x} = #{is_integer(x)}")
 IO.puts(" Is float #{x} =   #{is_float(x)}")
 IO.puts(" Is number #{x} = #{is_number(x)}")

 IO.puts("variable float");
 IO.puts(" Is boolean #{f} = #{is_boolean(f)}")
 IO.puts(" Is Integer #{f} = #{is_integer(f)}")
 IO.puts(" Is float #{f} =   #{is_float(f)}")
 IO.puts(" Is number #{f} = #{is_number(f)}")





IO.puts("trunc #{x} =#{trunc(x)}")
text="Hello world (#{isOpen})"
list=[1,"hola",2.3,false]
tuple={1,"2",3.0}
atom=:my_atom
m2=Myatom
div 5,1
div(35,7)
q= div(35, 4)
r=rem(35,4)
IO.puts("==============================")
text= "Hello world {#{isOpen}}"
text="pinguíno"
IO.puts(text)
IO.puts("is_binary{\"#{text}\"}= #{is_binary(text)}")
n=String.length(text)
IO.puts("is_binary{#{n}}= #{is_binary(n)}")
IO.puts("String.length{\"#{text}\"}= #{n}")
IO.puts("byte_size{\"#{text}\"}= #{byte_size(text)}")

IO.puts String.upcase(text)
IO.puts("==============================")
atom=:my_atom
atom2=MyAtom
IO.puts("  is_atom{4} = #{is_atom(4)}")
IO.puts("  is_atom{#{atom}} = #{is_atom(atom)}")
IO.puts("  is_boolean{#{atom}} = #{is_boolean(atom)}")
IO.puts("  is_atom{#{atom2}} = #{is_atom(atom2)}")
IO.puts("  is_boolean{#{atom2}} = #{is_boolean(atom2)}")

t=true
f=false
IO.puts("  is_atom{#{t}} = #{is_atom(t)}")
IO.puts("  is_atom{#{f}} = #{is_atom(f)}")
IO.puts(" {:true == true} = #{:true==true}")
IO.puts("{:false == false} = #{:false==false}")
IO.puts("#{:ok}")
IO.puts("#{:error}")

IO.puts("FUNCIONES ==============================")
add=  fn(x,y)->x+y end
sub=  fn(x,y)->x-y end
s=add.(1,2)
r=sub.(5,3)

IO.puts("id_function(add)=#{is_function(add)}")
IO.puts("id_function(sub)=#{is_function(sub)}")
IO.puts("add.(1,2)=#{s}")
IO.puts("add.(5,3)=#{r}")
IO.puts("id_function(add,0)=#{is_function(add,0)}")
IO.puts("id_function(add,1)=#{is_function(add,1)}")
IO.puts("id_function(add,2)=#{is_function(add,2)}")
IO.puts("id_function(add,3)=#{is_function(add,3)}")
double = fn x->add.(x, x) end
five= fn x->x+1 end .(4)
IO.puts("five=#{five}")
IO.puts("double.(2)=#{double.(2)}")


list=[1,"hola",2.3,false]
len=length list
IO.puts("length(list) #{length list}")
IO.inspect list
list=[1,"hola"]++[4,"y",:hello]
IO.inspect list
IO.puts("length(list)= #{length list}")
IO.puts("hd(list) = #{hd(list)}")
#IO.puts("tl(list) = #{tl(list)}")
IO.inspect tl(list)

IO.puts("==============================")
a=[1,4,2,3,7,5,6,9,3,2,8]
b=[3,2,20,5]
IO.puts "a--b="
IO.inspect a--b
IO.puts("==============================")
IO.puts "4 in [3,4]=#{4 in[3,4]}"
IO.puts "4  not in [3,4]=#{4  not in[3,4]}"
IO.puts "5 in [3,4]=#{5 not in[3,4]}"
IO.puts "5 not in [3,4]=#{5 not in[3,4]}"
5 in [3,4]
5 not in[3,4]
# iex hd[]
#tl[]
#[64,65]
#[11,12,13]
#[104,111,108,97]
IO.puts("==============================")
tuple={1,"2",3.0,true, :error}
{a,b,_,c,_}=tuple
IO.inspect tuple
IO.puts("a=#{a}, b=#{b}, c=#{c} ")
IO.inspect put_elem(tuple,2, :ok)
IO.inspect tuple

result=File.read("hello.ex")
IO.inspect result
IO.puts "elem(result,0)= #{elem(result,0)}"
result=File.read("hello.ex")

#tuples
{a,b,c}={1,"hello", :ok}
{a, _, c}={1,"hello",:ok}
b=true
{a,b,c}={1,"hello", :ok}
{a,^b,_}={1,true,"ok"}
{a,^b,_}={1,"hello","ok"}
b=false
#{a,^b,_}={1,true,"ok"}
#Lists
#[a,b,_]=[1,"hello",:ok]
#[a,_,c]=[1,"hello",:ok]
#b=true
#[a,^b,_]=[1,true,"ok"]
#b=false
#[a,^b,_]=[1,true,"ok"]
{x,x}={2,2}
#{x,x}={2,3}#throwsmatch error
[_ | tail]=[5.0, 3, :ok]# tail=[3, :ok]
[head| _]=[5.0, 3, :ok]# head=[5.0]

#CASE
#[head | tail]=[]#throw an MatchError
[head | tail]=[5.0]#head 5.0 tail=[]
[head | tail]=[5.0, 3]#head 5.0 tail=[3]
[head | tail]=[5.0, 3, :ok]#head 5.0 tail=[3, :ok]

[1 | tail]=[1,2,3]#tail=[2,3]
[2 | tail]=[1,2,3]#throws an MatchError

a=1
[â| tail]=[1,2,3]#tail=[2,3]
a=2
[â | tail]=[1,2,3]#throws an MatchError

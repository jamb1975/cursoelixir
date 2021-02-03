defmodule PrintInteger do
def classic(n) when is_integer(n) and n>0 do
      fprintintegerp(n,2,"1") # call function privada fprintintegerp
  # end
end
defp   fprintintegerp(n,i,s)  do
  IO.puts s #muestra la impresión de linea
  cond do
    i>n-> :ok #salimos
    true -> fprintintegerp(n,i+1,fformatlinae(1,n,i,"")) #ciclo para imprimir la liena 0 10 ...
  end
end
defp   fformatlinae( k,n, j, s )  do #función que me permite concatenar la cadena de impresión s donde k=1 n=numero de lineas i
  cond do
    k > j -> s #salimos cuando k=1 sea mayor al número de linea actual
    rem(k,2) > 0 -> fformatlinae(k + 1, n, j ,  "1" <> s)  #si es impar concatenamos el 1 a la izquierda
    true-> fformatlinae(k + 1, n, j ,   "0" <> s)  #si es par concatenamos el 0 a la izquierda
  end
end
end
PrintInteger.classic(10)

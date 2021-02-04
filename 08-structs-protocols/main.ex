# alias Geometry.Rectangle as Rectangle
#alias Geometry.Circle
#alias Geometry.Shape
alias Geometry.{Rectangle, Circle, Shape}
print = fn shape ->
  IO.puts("")
  IO.puts("area(#{inspect shape} = #{Shape.area(shape)}")
  IO.puts("perimeter(#{inspect shape} = #{Shape.perimeter(shape)}")
end
rect = %Rectangle{b: 3, h: 4}
print.(rect)

rect = %Rectangle{b: 4}
print.(rect)

rect = %Circle{r: 4}
print.(rect)

any = "Hola"
print.(rect)


#########################################
IO.puts rect.__struct__
#%{}.__struct__ # throws an error
IO.inspect Map.keys(rect)#[__struct__, :b, :h]
IO.inspect Map.values(rect)# [Geometry.Rectangle, 1, 1]
new_rect = %{rect | b: 1}
new_rect = %{rect | b: 1, h: 5}

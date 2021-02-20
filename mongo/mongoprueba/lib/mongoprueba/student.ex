defmodule Student do
  defstruct [:name, :phone, :edad]
  defimpl Mongo.Encoder do
    def encode(%{name: name, phone: phone, edad: edad, id: id}) do
        %{name: name, phone: phone, edad: edad, _id: id}
    end    
  end  
end 
student = %{}
#{:ok, conn} = Mongo.start_link(url: "mongodb://admon:7777@localhost:27017/sihic")
#cursor = Mongo.find(conn, "terceros", %{})
#cursor |> Enum.to_list() |> IO.inspect
#Mongo.insert_one!(conn, "terceros", %{name: "Javier Murcia", phone: "3102030435", age: 45})

defmodule CustomeError do
  defexception [:message, country: "Colombia"]
end

defmodule DefaultError do
  defexception  message: "My default Error"
end


#raise CustomeError
#raise Defaulterror
#raise DefaultError, message: "Not my default error"

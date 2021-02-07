defmodule CustomeError do
  defexception [:message, country: "Colombia"]
end

defmodule DefaultError do
  defexception  message: "My default Error"
end

try do

  raise CustomeError, message: "My custom error", country: "Colombia"
rescue
 e in CustomeError -> IO.puts("message: #{e.message}, country: #{e.country}")
end
#raise CustomeError
#raise Defaulterror
#raise DefaultError, message: "Not my default error"

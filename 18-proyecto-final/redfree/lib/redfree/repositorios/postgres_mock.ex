defmodule  PostgresMock do
  defstruct [:pid]

  use GenServer
  alias Redfree.{Tercero, Usuario, Amigo}
  def create() do
    {:ok, pid} = GenServer.start_link(__MODULE__, %{})
    %PostgresMock{pid: pid}  
  end  

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_call({:create_tercero, %{noident: noident, first_name: first_name, last_name: last_name, email: email, dir: dir, tel: tel, name_user: name_user, password: password}}, _, tercero_usuario) do
    tercero = %Tercero{noident: noident, first_name: first_name, last_name: last_name, email: email, tel: tel, dir: dir}
    usuario = %Usuario{name_user: name_user, password: password}
    tercero = Tercero.insert(tercero)
    usuario = Usuario.insert(usuario, tercero);
    amigo = Amigo.insert(usuario)
    tercero_usuario = %{id: tercero.id, noident: tercero.noident, first_name: tercero.first_name, last_name: tercero.last_name, email: tercero.email, dir: tercero.dir, tel: tercero.tel, id_user: usuario.id, name_user: tercero.name_user, password: usuario.password, id_amigo: amigo.id}
    {:reply, tercero_usuario, tercero_usuario}
  end
  
  @impl true
  def handle_call({:find_user, id}, _, {user_id, users} = state) do
    if user_id < id or id < 1 do
        {:reply, nil, state}
    else
        {:reply, users[id], state}
    end                
   end
end

defimpl DbHandler, for: PostgresMock do
    def create_tercero(handler, %{noident: _, first_name: _, last_name: _, email: _, tel: _, dir: _, name_user: _, password: _} = map) do
      GenServer.call(handler.pid, {:create_tercero, map})
    end 

    def find_tercero(handler, id) do
      GenServer.call(handler.pid, {:find_tercero, id})
    end
end     
      
    
    

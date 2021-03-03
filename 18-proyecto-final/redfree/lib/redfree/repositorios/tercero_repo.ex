defprotocol TerceroRepo do
  def create_one(repo, keywods)
  def find_one(repo, id)
end

defmodule TerceroRepoImpl do
  defstruct [:pid]
  
  use GenServer

  def start_link(db_handler) do
    {:ok, pid} = GenServer.start_link(__MODULE__, {db_handler, %{}})
    %TerceroRepoImpl{pid: pid}
  end
  
  @impl true
  def init(state), do: {:ok, state}
  
  @impl true
  def handle_call({:create_one,  keywods}, _, {db_handler,_user}) do
    user = DbHandler.create_tercero(db_handler, %{noident: keywods[:noident], first_name: keywods[:first_name], last_name: keywods[:last_name], email: keywods[:email], dir: keywods[:dir], tel: keywods[:tel], name_user: keywods[:name_user], password: keywods[:password]})
    {:reply,user, {db_handler, user}}
  
  end

  @impl true
  def handle_call({:find_one, id}, _, {db_handler, _user}) do
    user = DbHandler.find_tercero(db_handler, id)
    {:reply, user, {db_handler, user}}
  end
end

defmodule TerceroRepoImpl2 do
  @enforce_keys [:db]
  defstruct [:db]
  def create(db_handler), do: %TerceroRepoImpl2{db: db_handler}
end  


defimpl TerceroRepo, for: TerceroRepoImpl do
  def create_one(user_repo, keywods) when user_repo.pid != nil do
    GenServer.call(user_repo.pid, {:create_one, keywods})
  end
  
  def find_one(user_repo, id) when user_repo.pid != nil do
    GenServer.call(user_repo.pid, {:find_one, id})
  end
end

defimpl TerceroRepo, for: TerceroRepoImpl2 do
  def create_one(tercero_repo, keywods) when tercero_repo.db != nil do
    DbHandler.create_tercero(tercero_repo, %{noident: keywods[:noident], first_name: keywods[:first_name], last_name: keywods[:last_name], email: keywods[:email], dir: keywods[:dir], tel: keywods[:tel], name_user: keywods[:name_user], password: keywods[:password]})
  end
  
  def find_one(tercero_repo, id) when tercero_repo.db != nil do
    DbHandler.find_tercero(tercero_repo, id)
  end
end
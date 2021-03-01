defprotocol UserRepo do
  def create_one(repo, keywods)
  def find_one(repo, id)
end

defmodule UserRepoImpl do
  defstruct [:pid]
  
  use GenServer

  def start_link(db_handler) do
    {:ok, pid} = GenServer.start_link(__MODULE__, {db_handler, %{}})
    %UserRepoImpl{pid: pid}
  end
  
  @impl true
  def init(state), do: {:ok, state}
  
  @impl true
  def handle_call({:create_one,  keywods}, _, {db_handler,_user}) do
    user = DbHandler.create_user(db_handler, %{name: keywods[:name]})
    {:reply,user, {db_handler, user}}
  
  end

  @impl true
  def handle_call({:find_one, id}, _, {db_handler, _user}) do
    user = DbHandler.find_user(db_handler, id)
    {:reply, user, {db_handler, user}}
  end
end

defmodule UserRepoImpl2 do
  @enforce_keys [:db]
  defstruct [:db]
  def create(db_handler), do: %UserRepoImpl2{db: db_handler}
end  


defimpl UserRepo, for: UserRepoImpl do
  def create_one(user_repo, keywods) when user_repo.pid != nil do
    GenServer.call(user_repo.pid, {:create_one, keywods})
  end
  
  def find_one(user_repo, id) when user_repo.pid != nil do
    GenServer.call(user_repo.pid, {:find_one, id})
  end
end

defimpl UserRepo, for: UserRepoImpl2 do
  def create_one(user_repo, keywods) when user_repo.db != nil do
    DbHandler.create_user(user_repo.db, %{name: keywods[:name]})
  end
  
  def find_one(user_repo, id) when user_repo.db != nil do
    DbHandler.find_user(user_repo.db, id)
  end
end
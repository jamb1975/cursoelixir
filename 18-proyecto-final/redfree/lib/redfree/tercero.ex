defmodule Redfree.Tercero do
    use Ecto.Schema
    
    import Ecto.Query
    import Ecto.Changeset

    alias Redfree.{Usuario,  Repo, Tercero}

    schema "terceros" do
      field :noident, :integer  
      field :first_name # default string
      field :last_name 
      field :email 
      field :dir 
      field :tel 
      has_one :usuario, Usuario
    end

    def changeset(tercero, params \\ %{}) do
      tercero = %Tercero{}
       cast(tercero, params, [:noident, :first_name, :last_name, :email, :dir, :tel])
      # |> validate_required([:noident, :first_name, :last_name])
      # |> validate_format(:email, ~r/@/)
      # #|> validate_length(:noident, max: 20)
    end

    def changeset2(tercero, params \\ %{}) do
         cast(tercero, params, [:noident, :first_name, :last_name, :email, :dir, :tel])
    end
    
    
    def insert(maptercero) do
      #tercero = %Tercero{}
       # cstercero = changeset(tercero, maptercero )
        Repo.insert!(maptercero)
       # usuarioasoc = Ecto.build_assoc(tercero, :usuario, mapusuario)
       #Usuario.insert(usuarioasoc);
    end
    
    def keyword_query do
      query = from t in Tercero, select: t
      Repo.all(query)
    end
end    


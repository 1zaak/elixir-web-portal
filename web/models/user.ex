defmodule MsqhPortal.User do
  use MsqhPortal.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :state, :string
    belongs_to :membership, MsqhPortal.Membership
    belongs_to :facility, MsqhPortal.Facility

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :email, :password, :password_hash, :state])
    |> validate_required([:name, :username, :email, :password, :password_hash, :state])
  end
end

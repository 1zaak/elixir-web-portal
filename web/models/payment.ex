defmodule MsqhPortal.Payment do
  use MsqhPortal.Web, :model

  schema "payments" do
    field :amount, :string
    field :for_period, :string
    belongs_to :user, MsqhPortal.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:amount, :for_period])
    |> validate_required([:amount, :for_period])
  end
end

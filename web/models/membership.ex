defmodule MsqhPortal.Membership do
  use MsqhPortal.Web, :model

  schema "memberships" do
    field :rate_year, :integer
    field :rate, :integer
    field :period, :string
    field :use_period, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:rate_year, :rate, :period, :use_period])
    |> validate_required([:rate_year, :rate, :period, :use_period])
  end
end

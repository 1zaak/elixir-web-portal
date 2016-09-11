defmodule MsqhPortal.Facility do
  use MsqhPortal.Web, :model

  schema "facilities" do
    field :facility_name, :string
    belongs_to :membership, MsqhPortal.Membership

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:facility_name])
    |> validate_required([:facility_name])
  end
end

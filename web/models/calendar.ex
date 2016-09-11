defmodule MsqhPortal.Calendar do
  use MsqhPortal.Web, :model

  schema "calendars" do
    field :cal_name, :string
    belongs_to :user, MsqhPortal.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cal_name])
    |> validate_required([:cal_name])
  end
end

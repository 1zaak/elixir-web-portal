defmodule MsqhPortal.Event do
  use MsqhPortal.Web, :model

  schema "events" do
    field :event_title, :string
    field :start, :integer
    field :end, :integer
    belongs_to :calendar, MsqhPortal.Calendar

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:event_title, :start, :end])
    |> validate_required([:event_title, :start, :end])
  end
end

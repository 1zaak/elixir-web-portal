defmodule MsqhPortal.UserPhoto do
  use MsqhPortal.Web, :model

  schema "userphotos" do
    field :title, :string
    field :file_path, :string
    field :object, :string
    belongs_to :user, MsqhPortal.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :file_path, :object])
    |> validate_required([:title, :file_path, :object])
  end
end

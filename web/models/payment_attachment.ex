defmodule MsqhPortal.PaymentAttachment do
  use MsqhPortal.Web, :model

  schema "payment_attachments" do
    field :file_path, :string
    belongs_to :payment, MsqhPortal.Payment

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:file_path])
    |> validate_required([:file_path])
  end
end

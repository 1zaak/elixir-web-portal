defmodule MsqhPortal.UserEnquiryAttachment do
  use MsqhPortal.Web, :model

  schema "user_enquiry_attachments" do
    field :file_path, :string
    belongs_to :user_enquiry, MsqhPortal.UserEnquiry

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

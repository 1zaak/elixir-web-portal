defmodule MsqhPortal.Repo.Migrations.CreateUserEnquiryAttachment do
  use Ecto.Migration

  def change do
    create table(:userenquiryattachments) do
      add :file_path, :string
      add :user_enquiry_id, references(:userenquiries, on_delete: :nothing)

      timestamps()
    end
    create index(:userenquiryattachments, [:user_enquiry_id])

  end
end

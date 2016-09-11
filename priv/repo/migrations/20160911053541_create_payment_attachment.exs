defmodule MsqhPortal.Repo.Migrations.CreatePaymentAttachment do
  use Ecto.Migration

  def change do
    create table(:paymentattachments) do
      add :file_path, :string
      add :payment_id, references(:payments, on_delete: :nothing)

      timestamps()
    end
    create index(:paymentattachments, [:payment_id])

  end
end

defmodule MsqhPortal.Repo.Migrations.CreateUserPhoto do
  use Ecto.Migration

  def change do
    create table(:userphotos) do
      add :title, :string
      add :file_path, :string
      add :object, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:userphotos, [:user_id])

  end
end

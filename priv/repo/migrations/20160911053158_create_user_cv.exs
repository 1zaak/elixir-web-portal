defmodule MsqhPortal.Repo.Migrations.CreateUserCv do
  use Ecto.Migration

  def change do
    create table(:usercvs) do
      add :title, :string
      add :file_path, :string
      add :object, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:usercvs, [:user_id])

  end
end

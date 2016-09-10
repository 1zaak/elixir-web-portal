defmodule MsqhPortal.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :email, :string
      add :pass, :string
      add :password_hash, :string
      add :state, :string
      add :membership, references(:memberships, on_delete: :nothing)
      add :facility, references(:facilities, on_delete: :nothing)

      timestamps()
    end
    create index(:users, [:membership])
    create index(:users, [:facility])

  end
end

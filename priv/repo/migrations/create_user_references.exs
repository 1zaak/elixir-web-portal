defmodule MsqhPortal.Repo.Migrations.CreateUserReferences do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add :membership, references(:memberships, on_delete: :nothing)
      add :facility, references(:facilities, on_delete: :nothing)

    end
    create index(:users, [:membership])
    create index(:users, [:facility])

  end
end

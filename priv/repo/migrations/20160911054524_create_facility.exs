defmodule MsqhPortal.Repo.Migrations.CreateFacility do
  use Ecto.Migration

  def change do
    create table(:facilities) do
      add :facility_name, :string
      add :membership_id, references(:memberships, on_delete: :nothing)

      timestamps()
    end
    create index(:facilities, [:membership_id])

    alter table(:users) do
      add :membership, references(:memberships, on_delete: :nothing)
      add :facility, references(:facilities, on_delete: :nothing)

    end
    create index(:users, [:membership])
    create index(:users, [:facility])


  end
end

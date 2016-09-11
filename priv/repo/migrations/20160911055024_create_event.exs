defmodule MsqhPortal.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :event_title, :string
      add :start, :integer
      add :end, :integer
      add :calendar_id, references(:calendars, on_delete: :nothing)

      timestamps()
    end
    create index(:events, [:calendar_id])

  end
end

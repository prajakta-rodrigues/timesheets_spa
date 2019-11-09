defmodule TimesheetsSpa.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :date, :date, null: false
      add :requester_id, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:requests, [:requester_id])
  end
end

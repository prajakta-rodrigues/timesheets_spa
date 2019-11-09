defmodule TimesheetsSpa.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :time_utilized, :time, null: false
      add :description, :string
      add :request_id, references(:requests, on_delete: :delete_all), null: false
      add :job_id, references(:jobs, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:tasks, [:request_id])
    create index(:tasks, [:job_id])
  end
end

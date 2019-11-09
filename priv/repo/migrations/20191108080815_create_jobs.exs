defmodule TimesheetsSpa.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :name, :string, null: false
      add :code, :string, null: false

      timestamps()
    end

  end
end

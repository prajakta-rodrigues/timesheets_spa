defmodule TimesheetsSpa.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :name, :string
      add :role, :string, null: false
      add :manager_id, references(:users, on_delete: :delete_all)
      add :password_hash, :string, null: false

      timestamps()
    end

    create index(:users, [:manager_id])
  end
end

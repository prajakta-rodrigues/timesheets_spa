defmodule TimesheetsSpa.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :time_utilized, :time
    belongs_to :request, TimesheetsSpa.Requests.Request
    belongs_to :job, TimesheetsSpa.Jobs.Job

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:time_utilized, :description, :request_id, :job_id])
    |> validate_required([:time_utilized, :description, :request_id, :job_id])
  end
end

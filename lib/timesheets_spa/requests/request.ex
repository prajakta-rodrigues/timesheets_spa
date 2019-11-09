defmodule TimesheetsSpa.Requests.Request do
  use Ecto.Schema
  import Ecto.Changeset

  schema "requests" do
    field :date, :date
    belongs_to :user, TimesheetsSpa.Users.User
    timestamps()
  end

  @doc false
  def changeset(request, attrs) do
    request
    |> cast(attrs, [:date, :requester_id])
    |> validate_required([:date, :requester_id])
  end
end

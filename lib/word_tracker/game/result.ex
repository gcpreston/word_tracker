defmodule WordTracker.Game.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :data, :map

    belongs_to :team, WordTracker.Game.Team

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:data, :team_id])
    |> validate_required([:data, :team_id])
  end
end

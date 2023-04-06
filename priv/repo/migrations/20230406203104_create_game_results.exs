defmodule WordTracker.Repo.Migrations.CreateGameResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :data, :map, null: false
      add :team_id, references(:teams, on_delete: :nothing)

      timestamps()
    end
  end
end

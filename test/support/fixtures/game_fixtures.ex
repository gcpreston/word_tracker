defmodule WordTracker.GameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WordTracker.Game` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> WordTracker.Game.create_team()

    team
  end
end

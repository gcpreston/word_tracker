defmodule WordTrackerWeb.TeamJSON do
  alias WordTracker.Game.Team

  @doc """
  Renders a list of teams.
  """
  def index(%{teams: teams}) do
    %{data: for(team <- teams, do: data(team))}
  end

  defp data(%Team{} = team) do
    %{
      id: team.id,
      name: team.name
    }
  end
end

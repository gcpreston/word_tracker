defmodule WordTrackerWeb.ResultJSON do
  alias WordTracker.Game.Result

  @doc """
  Renders a single result.
  """
  def show(%{result: result}) do
    %{data: data(result)}
  end

  defp data(%Result{} = result) do
    %{
      id: result.id,
      team_id: result.team_id,
      data: result.data
    }
  end
end

defmodule WordTrackerWeb.TeamController do
  use WordTrackerWeb, :controller

  alias WordTracker.Game

  def index(conn, _params) do
    teams = Game.list_teams()
    render(conn, :index, teams: teams)
  end
end

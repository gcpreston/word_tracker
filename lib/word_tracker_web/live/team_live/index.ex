defmodule WordTrackerWeb.TeamLive.Index do
  use WordTrackerWeb, :live_view

  alias WordTracker.Game
  alias WordTracker.Game.Team

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Game.subscribe(:team)
    end

    {:ok, stream(socket, :teams, Game.list_teams())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Team")
    |> assign(:team, Game.get_team!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Team")
    |> assign(:team, %Team{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Teams")
    |> assign(:team, nil)
  end

  @impl true
  def handle_info({WordTrackerWeb.TeamLive.FormComponent, {:saved, team}}, socket) do
    {:noreply, stream_insert(socket, :teams, team)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    team = Game.get_team!(id)
    {:ok, _} = Game.delete_team(team)

    {:noreply, stream_delete(socket, :teams, team)}
  end

  @impl true
  def handle_info({Game, [:team, :created], team}, socket) do
    {:noreply, stream_insert(socket, :teams, team)}
  end

  def handle_info({Game, [:team, :updated], team}, socket) do
    {:noreply, stream_insert(socket, :teams, team)}
  end

  def handle_info({Game, [:team, :deleted], team}, socket) do
    {:noreply, stream_delete(socket, :teams, team)}
  end

  def handle_info({Game, _, _}, socket) do
    {:noreply, socket}
  end
end

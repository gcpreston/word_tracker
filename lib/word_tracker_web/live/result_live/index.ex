defmodule WordTrackerWeb.ResultLive.Index do
  use WordTrackerWeb, :live_view

  alias WordTracker.Game

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Game.subscribe(:result)
    end

    {:ok, stream(socket, :results, Game.list_results())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Results")
    |> assign(:result, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    result = Game.get_result!(id)
    {:ok, _} = Game.delete_result(result)

    {:noreply, stream_delete(socket, :results, result)}
  end

  @impl true
  def handle_info({Game, [:result, :created], result}, socket) do
    {:noreply, stream_insert(socket, :results, result)}
  end

  def handle_info({Game, [:result, :updated], result}, socket) do
    {:noreply, stream_insert(socket, :results, result)}
  end

  def handle_info({Game, [:result, :deleted], result}, socket) do
    {:noreply, stream_delete(socket, :results, result)}
  end

  def handle_info({Game, _, _}, socket) do
    {:noreply, socket}
  end
end

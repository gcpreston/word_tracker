defmodule WordTrackerWeb.ResultController do
  use WordTrackerWeb, :controller

  alias WordTracker.Game
  alias WordTracker.Game.Result

  def create(conn, %{"result" => result_params}) do
    with {:ok, %Result{} = result} <- Game.create_result(result_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", "TODO?")
      |> render(:show, result: result)
    end
  end
end

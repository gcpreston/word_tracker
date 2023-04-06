defmodule WordTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WordTrackerWeb.Telemetry,
      # Start the Ecto repository
      WordTracker.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: WordTracker.PubSub},
      # Start Finch
      {Finch, name: WordTracker.Finch},
      # Start the Endpoint (http/https)
      WordTrackerWeb.Endpoint
      # Start a worker by calling: WordTracker.Worker.start_link(arg)
      # {WordTracker.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WordTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WordTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

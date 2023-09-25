defmodule Project1SqliteWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Project1SqliteWeb.Telemetry,
      # Start the Endpoint (http/https)
      Project1SqliteWeb.Endpoint
      # Start a worker by calling: Project1SqliteWeb.Worker.start_link(arg)
      # {Project1SqliteWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Project1SqliteWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Project1SqliteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

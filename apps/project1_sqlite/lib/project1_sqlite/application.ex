defmodule Project1Sqlite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Project1Sqlite.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Project1Sqlite.PubSub},
      # Start Finch
      {Finch, name: Project1Sqlite.Finch}
      # Start a worker by calling: Project1Sqlite.Worker.start_link(arg)
      # {Project1Sqlite.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Project1Sqlite.Supervisor)
  end
end

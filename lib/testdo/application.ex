defmodule Testdo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TestdoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Testdo.PubSub},
      # Start the Endpoint (http/https)
      TestdoWeb.Endpoint
      # Start a worker by calling: Testdo.Worker.start_link(arg)
      # {Testdo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testdo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TestdoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

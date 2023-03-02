defmodule Radioparty.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RadiopartyWeb.Telemetry,
      # Start the Ecto repository
      Radioparty.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Radioparty.PubSub},
      # Start Finch
      {Finch, name: Radioparty.Finch},
      # Start the Endpoint (http/https)
      RadiopartyWeb.Endpoint
      # Start a worker by calling: Radioparty.Worker.start_link(arg)
      # {Radioparty.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Radioparty.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RadiopartyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

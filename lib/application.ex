defmodule DeliverProject.Application do
  use Application

  require Logger

  def start(_, _) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: DeliverProject, options: [port: 8080]}
    ]
    opts = [strategy: :one_for_one, name: DeliverProject.Supervisor]

    Logger.info("Application has started...")
    Supervisor.start_link(children, opts)
  end
end

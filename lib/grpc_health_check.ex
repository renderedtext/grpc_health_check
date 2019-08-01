defmodule GrpcHealthCheck do
  require Logger
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    Logger.info "GRPC Healthcheck started"

    children = [
      supervisor(Task.Supervisor, [[name: GrpcHealthCheck.TaskSupervisor]])
    ]

    opts = [strategy: :one_for_one, name: GrpcHealthCheck.Supervisor]

    Supervisor.start_link(children, opts)
  end
end

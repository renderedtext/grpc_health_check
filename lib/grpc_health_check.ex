defmodule GrpcHealthCheck do
  require Logger
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    Logger.info "GRPC Healthcheck started"

    children = [
      supervisor(GRPC.Server.Supervisor, [{GrpcHealthCheck.Server, 50051}])
    ]

    opts = [strategy: :one_for_one, name: GrpcHealthCheck]

    Supervisor.start_link(children, opts)
  end
end

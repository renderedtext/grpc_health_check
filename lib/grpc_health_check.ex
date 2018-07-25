defmodule GrpcHealthCheck do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(GRPC.Server.Supervisor, [{GrpcHealthCheck.Server, 50051}])
    ]

    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end

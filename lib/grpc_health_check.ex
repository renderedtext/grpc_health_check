defmodule GrpcHealthCheck do
  require Logger
  use Application

  def start(_type, _args) do
    Logger.info "GRPC Healthcheck started"

    children = []

    opts = [strategy: :one_for_one, name: GrpcHealthCheck]
    Supervisor.start_link(children, opts)
  end
end

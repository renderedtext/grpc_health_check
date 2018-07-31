defmodule GrpcHealthCheck do
  require Logger
  use Application

  def start(_type, _args) do
    Logger.info "GRPC Healthcheck started"
  end
end

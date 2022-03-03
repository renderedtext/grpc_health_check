defmodule GrpcHealthCheck do
  require Logger
  use Application

  def start(_type, _args) do
    children = []

    opts = [strategy: :one_for_one, name: GrpcHealthCheck]
    Supervisor.start_link(children, opts)
  end

  def verbose_log(msg) do
    if logs_enabled?() do
      Logger.info(msg)
    end
  end

  defp logs_enabled?() do
    Application.get_env(:grpc_health_check, :verbose_log, false) == true
  end
end

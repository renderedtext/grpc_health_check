defmodule GrpcHealthCheck.Client do
  require Logger

  def call do
    Application.ensure_all_started(:gun)

    healthcheck = Task.Supervisor.async_nolink(GrpcHealthCheck.TaskSupervisor, fn -> request end)
    {:ok, check} = Task.yield(healthcheck)

    Logger.info "Healthcheck request completed"
  end

  def request do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
    request = Grpc.Health.V1.HealthCheckRequest.new(service: "healthcheck")

    {:ok, reply} = channel |> Grpc.Health.V1.Health.Stub.check(request)
  end
end

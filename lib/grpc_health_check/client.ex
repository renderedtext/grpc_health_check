defmodule GrpcHealthCheck.Client do
  require Logger

  def call(port) do
    Application.ensure_all_started(:gun)

    {:ok, channel} = GRPC.Stub.connect("localhost:#{port}")
    request = Grpc.Health.V1.HealthCheckRequest.new(service: "healthcheck")

    {:ok, reply} = channel |> Grpc.Health.V1.Health.Stub.check(request)

    Logger.info "Healthcheck request completed"
  end
end

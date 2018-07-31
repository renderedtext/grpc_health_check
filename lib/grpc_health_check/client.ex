defmodule GrpcHealthCheck.Client do
  require Logger

  def call do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
    request = Grpc.Health.V1.HealthCheckRequest.new(service: "healthcheck")

    {:ok, reply} = channel |> Grpc.Health.V1.Health.Stub.check(request)

    Logger.info "Healthcheck request completed"
  end
end

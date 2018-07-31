defmodule GrpcHealthCheck.Client do

  def call do
    Application.ensure_all_started(:gun)

    {:ok, channel} = GRPC.Stub.connect("localhost:50055")
    request = Grpc.Health.V1.HealthCheckRequest.new(service: "healthcheck")

    {:ok, reply} = channel |> Grpc.Health.V1.Health.Stub.check(request)
  end
end

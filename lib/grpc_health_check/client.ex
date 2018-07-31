defmodule GrpcHealthCheck.Client do

  def call do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
    request = Grpc.Health.V1.HealthCheckRequest.new(service: "healthcheck")
    {:ok, reply} = channel |> Grpc.Health.V1.Health.Stub.check(request)
  end
end

defmodule GrpcHealthCheck.Server do
  use GRPC.Server, service: Grpc.Health.V1.Health.Service

  alias Grpc.Health.V1.HealthCheckResponse

  def check(_req, _stream) do
    GrpcHealthCheck.verbose_log("Received healthcheck request")

    HealthCheckResponse.new(status: HealthCheckResponse.ServingStatus.value(:SERVING))
  end
end

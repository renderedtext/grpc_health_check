defmodule GrpcHealthCheck.Server do
  use GRPC.Server, service: Grpc.Health.V1.Health.Service
  require Logger

  alias Grpc.Health.V1.HealthCheckResponse

  def check(_req, _stream) do
    Logger.info "Received healthcheck request"

    HealthCheckResponse.new(
      status: HealthCheckResponse.ServingStatus.value(:SERVING)
    )
  end
end

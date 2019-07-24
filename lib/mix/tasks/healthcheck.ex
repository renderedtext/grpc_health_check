defmodule Mix.Tasks.Healthcheck do
  use Mix.Task

  @shortdoc "Runs healthcheck for GRPC server"
  @moduledoc "Runs healthcheck for GRPC server"

  def run(args) do
    port = Eunm.at(args, 0) || "50051"
    GrpcHealthCheck.Client.call(port)
  end
end

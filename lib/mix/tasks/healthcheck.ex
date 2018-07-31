defmodule Mix.Tasks.Healthcheck do
  use Mix.Task

  @shortdoc "Runs healthcheck for GRPC server"
  @moduledoc "Runs healthcheck for GRPC server"

  def run(_) do
    GrpcHealthCheck.Client.call()
  end
end

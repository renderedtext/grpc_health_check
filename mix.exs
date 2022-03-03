defmodule GrpcHealthCheck.Mixfile do
  use Mix.Project

  def project do
    [
      app: :grpc_health_check,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {GrpcHealthCheck, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:protobuf, "~> 0.5.3"},
      {:grpc, "~> 0.3.1"}
    ]
  end
end

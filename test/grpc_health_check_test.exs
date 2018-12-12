defmodule GrpcHealthCheckTest do
  use ExUnit.Case
  doctest GrpcHealthCheck

  test "greets the world" do
    assert GrpcHealthCheck.hello() == :world
  end
end

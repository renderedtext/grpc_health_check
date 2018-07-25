# GrpcHealthCheck

GrprHealthCheck implements the official Grpc health checking interface in
Elixir. It can be used to check if Elixir based Grpc servers are up and running.

More on Grpc health checks:
- [Official doc](https://github.com/grpc/grpc/blob/master/doc/health-checking.md)
- [Interface definition
    source](https://github.com/grpc/grpc/blob/master/src/proto/grpc/health/v1/health.proto)
- [Ruby native
    implementation](https://github.com/grpc/grpc/tree/master/src/ruby/pb/grpc/health/v1)

## Installation

Add this to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:grpc_health_check, github: "renderedtext/grpc_health_check"}
  ]
end
```

Also, add this it to the list of your applications:

```elixir
def application do
  [applications: [:grpc_health_check]]
end
```

## Usage

The health check server will be running with you application.
TODO: How to write a client to check the server

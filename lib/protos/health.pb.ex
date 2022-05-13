defmodule Grpc.Health.V1.HealthCheckResponse.ServingStatus do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3
  @type t :: integer | :UNKNOWN | :SERVING | :NOT_SERVING

  field :UNKNOWN, 0

  field :SERVING, 1

  field :NOT_SERVING, 2
end

defmodule Grpc.Health.V1.HealthCheckRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service: String.t()
        }

  defstruct [:service]

  field :service, 1, type: :string
end

defmodule Grpc.Health.V1.HealthCheckResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: Grpc.Health.V1.HealthCheckResponse.ServingStatus.t()
        }

  defstruct [:status]

  field :status, 1, type: Grpc.Health.V1.HealthCheckResponse.ServingStatus, enum: true
end

defmodule Grpc.Health.V1.Health.Service do
  @moduledoc false
  use GRPC.Service, name: "grpc.health.v1.Health"

  rpc :Check, Grpc.Health.V1.HealthCheckRequest, Grpc.Health.V1.HealthCheckResponse
end

defmodule Grpc.Health.V1.Health.Stub do
  @moduledoc false
  use GRPC.Stub, service: Grpc.Health.V1.Health.Service
end

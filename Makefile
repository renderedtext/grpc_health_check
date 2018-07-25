pb.gen:
	rm -rf lib/protos && mkdir -p lib/protos
	protoc -I lib/protodef --elixir_out=plugins=grpc:lib/protos --plugin=`echo ~/.mix/escripts/protoc-gen-elixir` lib/protodef/health.proto

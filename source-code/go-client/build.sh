source ../../.env
DOCKER_DEFAULT_PLATFORM=$DOCKER_DEFAULT_PLATFORM
export DOCKER_DEFAULT_PLATFORM

docker build --platform=$DOCKER_DEFAULT_PLATFORM -t resulguldibi/sentinel-go-client .
source ../.env
DOCKER_DEFAULT_PLATFORM=$DOCKER_DEFAULT_PLATFORM
export DOCKER_DEFAULT_PLATFORM

docker build --platform=$DOCKER_DEFAULT_PLATFORM -t resulguldibi/sentinel -f sentinel/Dockerfile .
docker build --platform=$DOCKER_DEFAULT_PLATFORM -t resulguldibi/master -f master/Dockerfile .
docker build --platform=$DOCKER_DEFAULT_PLATFORM -t resulguldibi/slave -f slave/Dockerfile .
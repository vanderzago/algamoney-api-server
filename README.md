# algamoney-api-server
docker build -t algamoney-api-server .
docker run --rm --name algamoney-api-server -p 8080:8080 -d algamoney-api-server
docker logs algamoney-api-server -f
docker stop algamoney-api-server

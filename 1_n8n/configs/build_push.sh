# Set docker image version
version="0.1"

# Login to Docker Hub
docker login

# Build n8n custom image
docker build \
    --platform linux/amd64 \
    -t my-n8n:custom \
    -f custom_n8n.Dockerfile \
    .

# Tag and push the image to Docker Hub
# By version
docker tag my-n8n:custom minhhuunguyen/my-custom-n8n:$version
docker push minhhuunguyen/my-custom-n8n:$version

# By latest
docker tag my-n8n:custom minhhuunguyen/my-custom-n8n:latest
docker push minhhuunguyen/my-custom-n8n:latest

# Remove everything: containers, images, volumes, networks
docker system prune -a --volumes -f

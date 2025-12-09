
#!/bin/bash
set -euxo pipefail

# Install Docker
amazon-linux-extras install -y docker || true
systemctl enable docker
systemctl start docker

IMAGE_REPO="${docker_image_repo}"
IMAGE_TAG="${docker_image_tag}"
APP_PORT="${app_port}"

# Pull and run container
(docker rm -f bdp-app || true)
docker pull ${IMAGE_REPO}:${IMAGE_TAG}

docker run -d --restart=always \
  -e PORT=${APP_PORT} \
  -p 80:${APP_PORT} \
  --name bdp-app \
  ${IMAGE_REPO}:${IMAGE_TAG}

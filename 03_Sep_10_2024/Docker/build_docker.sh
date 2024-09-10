#!/bin/bash

# Image settings
user_name=rkrispin
image_label=darts_poc
image_tag=0.0.1
image_name=$user_name/$image_label:$image_tag


echo "Build the docker"

docker build . -f Dockerfile \
               --progress=plain \
               --build-arg QUARTO_VER=$QUARTO_VER \
               --build-arg VENV_NAME="darts-poc" \
               -t $image_name

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
#docker push $image_name
else
echo "Docker build failed"
fi
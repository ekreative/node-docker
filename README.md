# Node docker image

Image used for running node/js tests on our ci server

## Build command

    docker build -t ekreative/node .

## Build an app

    docker run -ti --rm --volume=$(pwd):/opt/workspace ekreative/node npm test

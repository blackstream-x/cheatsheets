# Docker

## Show all names of exited containers

`docker ps --filter status=exited | awk 'NR > 1 { print $NF }'`

## Remove all exited container by name

`docker ps --filter status=exited | awk 'NR > 1 { print $NF }' | xargs docker rm`


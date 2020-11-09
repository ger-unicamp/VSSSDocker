![](https://img.shields.io/github/workflow/status/rodrigocaus/VSSSDocker/CI/master)

# VSSSDocker

Docker files to generate and run a container with GER VSSS team strategy

## Requirements

 - Docker 19.03+

## Build image

Run the shell script:
```bash
$ ./dockerbuild.sh
```
Use `chmod +x` or `chmod 777` to give shell script some permissions.

## Run the container

Run the shell script:
```bash
$ ./rundocker.sh
```

If you want to select the team color or other network config,
change the variables on top of *rundocker.sh*. Default is:
```bash
TEAM_YELLOW=false

MULTICAST_IP=224.0.0.1
COMMAND_IP=127.0.0.1

COMMAND_PORT=20011
VISION_PORT=10002
REFEREE_PORT=10003
REPLACER_PORT=10004
```

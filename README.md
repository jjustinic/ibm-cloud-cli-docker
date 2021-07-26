# ibm-cloud-cli-docker

This repository defines a docker image container the IBM Cloud CLI. The image is based on Alpine Linux and runs as a non-root user named `ibmcloud`.

## Using Image

### Pull Image

```
docker pull jjustinic/ibm-cloud-cli
```

### Run Single Command

When running a single command, the `ibmcloud` command is called automatically. It is only necessary to pass the arguments.

```
docker run jjustinic/ibm-cloud-cli help
```

### Run Multiple Commands

Use `-c` to run a series of commands. The full commands are required, including `ibmcloud`, and should be quoted.

```
docker run jjustinic/ibm-cloud-cli -c 'ibmcloud help && ibmcloud config --list'
```

### Run interactively

To use the IBM Cloud CLI interactively, use `-c` with the shell as the command.

```
docker run -it jjustinic/ibmcloud -c '/bin/sh'
```

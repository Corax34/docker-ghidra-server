<p align="center">
  <a href="https://hub.docker.com/r/bytehow/ghidra-server"><h3 align="center">docker-ghidra-server</h3></a>
  <p align="center">Ghidra Server Docker Image</p>

## Why?

Standing up a Ghidra Server in the cloud is a pain. It doesn't have to be. If you're new to Ghidra Server, [this primer](https://byte.how/posts/collaborative-reverse-engineering/) is a good introduction.

## Getting Started

Start the server and connect to port 13100 with a Ghidra client that has a **matching** version. All users will be created as admins and will have initial password `changeme`, which Ghidra will require you to change after you login.

## Building

Note: Make sure to adjust the LDAP configuration inside the jaas.config file as needed.

```bash
git clone --branch LDAP https://github.com/Corax34/docker-ghidra-server.git
cd docker-ghidra-server
docker build -t local-image-11.2.1 .
```

### Run Public Server

```bash
docker run -it \
    --name ghidra-server \
    -v ghidra_repos_volume:/repos \
    -p 13100-13102:13100-13102 \
    local-image-11.2.1
```

## Environment Variables

| Name | Description | Required | Default |
| - | - | - | - |
|`GHIDRA_PUBLIC_HOSTNAME` | IP or hostname that remote users will use to connect to server. Set to `0.0.0.0` if hosting locally. If not set, it will try to discover your public ip by querying OpenDNS | No | Your public IP | 

## Additional information

Additional information such as capacity planning and other server configuration aspects can be found by consulting the server documentation provided at `/<GhidraInstallDir>/server/svrREADME.html`


## Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/bytehow/docker-ghidra-server/issues/new)

## Credits

- NSA Research Directorate [https://www.ghidra-sre.org/](https://www.ghidra-sre.org/)
- blacktop's [docker-ghidra](https://github.com/blacktop/ghidra-server) project

### License

Apache License (Version 2.0)

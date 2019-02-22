
# docker-bitsendd

[![Build Status](https://travis-ci.org/dalijolijo/docker-bitsendd.svg?branch=master)](https://travis-ci.org/dalijolijo/docker-bitsendd)
[![Docker Pulls](https://img.shields.io/docker/pulls/dalijolijo/bitsendd.svg)](https://hub.docker.com/r/dalijolijo/bitsendd)

> Run a full Bitsend node with one command

A Docker configuration with sane defaults for running a full
Bitsend node.

## Usage

```
docker run -v /home/username/.bitsend:/data -p 5889:5889 dalijolijo/bitsendd
```

If there's a `bitsend.conf` in the `/data` volume it'll be used. If not, one will be created for you with a randomly generated JSON-RPC password.

### JSON-RPC

To access JSON-RPC you'll also need to expose port 5888. You probably only want this available to localhost:

```
docker run -v /home/username/.bitsend:/data -p 5889:5889 -p 127.0.0.1:5888:5888 dalijolijo/bitsendd
```

### CLI Arguments

All CLI arguments are passed directly through to bitsendd.

You can use this to configure via CLI args without a config file:

```
docker run -v /home/username/.bitsend:/data \
  -p 5889:5889 \
  -p 127.0.0.1:5888:5888 \
  dalijolijo/bitsendd -rpcuser=<USERNAME> -rpcpassword=<PWD>
```

Or just use the container like a bitsendd binary:

```
$ docker run dalijolijo/bitsendd -version
```

### Version

You can also run a specific version of bitsendd if you want.

```
docker run -v /home/username/.bitsend:/data -p 5889:5889 dalijolijo/bitsendd:<VERSION>
```

## License

MIT © LIMXTEC

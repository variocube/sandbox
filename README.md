# Variocube Sandbox

Local development environment for integration with Variocube services. It allows you to run a full Variocube 
stack on your machine, including an emulation of a locker facility.

Currently, the repo hosts the following sandbox environments:
 - [logistics](logistics): Full stack of the logistics application; suitable for developing integrations against the logistics API. |
 - [center](center): Cube functionality and center; suitable for developing an application against center.                    |
 - [center+controller](center+controller): Controller and center; suitable for developing an application against center and on the cube.            |
 - [controller+apphost](controller+apphost): Controller and app-host connecting to dev center.


## Getting started

1. Make sure you have [docker](https://docker.com) and [docker-compose](https://docs.docker.com/compose/) installed
on your system. Please follow the guides on the docker website to learn about installation and the basics of docker.

2. Clone this repository:

```shell
git clone https://github.com/variocube/sandbox.git sandbox
```

3. Change to the directory of your desired sandbox:
 
 - Variocube Logistics:

```shell
cd sandbox/logistics
```

 - Center:

```shell
cd sandbox/center
```

 - Center + Controller:

```shell
cd sandbox/center+controller
```

 - Controller + App-Host:

```shell
cd sandbox/controller+apphost
```

4. Run the stack:

```shell
docker-compose up   # For standalone docker-compose
docker compose up   # For compose as docker plugin
```

At the first start, the docker images will be downloaded. This might take some time. Subsequent starts will be faster.

Once the stack starts up, you will see a bunch of log output on your console.

5. Open the provided [sandbox.html](./sandbox.html) in your browser to operate the emulated locker facility.

6. Stop the stack with `Ctlr+C` when you're done. 

## Updating

If you want to update to the latest version of Variocube services, change to the directory of your desired sandbox
and run:

```shell
docker-compose pull   # For standalone docker-compose  
docker compose pull   # For compose as docker plugin
```


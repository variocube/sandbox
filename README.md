# Variocube Sandbox

Local development environment for integration with Variocube services. It allows you to run a full Variocube
stack on your machine, including an emulation of a locker facility.

Currently, the repo hosts the following sandbox environments:

- [logistics](logistics): Full stack of the logistics application; suitable for developing integrations against the
  logistics API. Runs logistics (port 5000), center (7000), center admin (7001), controller (9000), app-host (4000)
  and MariaDB.
- [center](center): Cube functionality and center; suitable for developing an application against center. Runs center
  (7000), center admin (7001), controller (9000), app-host (4000) and MariaDB.
- [center+controller](center+controller): Controller and center; suitable for developing an application against center
  and on the cube. Runs center (7000), center admin (7001), controller (9000) and MariaDB.
- [controller+apphost](controller+apphost): Controller and app-host connecting to Variocube's dev center. Runs
  controller (9000) and app-host (4000).

In the local sandboxes, the emulated cube is called `sandbox`. The local center assigns it to the tenant `variocube`
and gives it 16 boxes.

## Getting started

1. Make sure you have [docker](https://docker.com) with [Docker Compose](https://docs.docker.com/compose/) v2 installed
   on your system. Please follow the guides on the docker website to learn about installation and the basics of docker.

   The Variocube images are built for `linux/amd64`. On Apple Silicon Macs, Docker Desktop runs them under emulation;
   they work, but start more slowly.

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

4. Controller + App-Host only: name your cube. Copy the example file:

```shell
cp .env.example .env     # Linux, macOS
copy .env.example .env   # Windows
```

Then open `.env` in a text editor and set `CUBE_ID` to `<company short name>-sandbox-<nn>`, e.g.
`CUBE_ID=acme-sandbox-01`. The name may contain letters, digits, `.`, `-` and `_` (at most 255 characters) and must
be unique at Variocube. Your cube appears at Variocube's dev center under this name; tell Variocube the name, so they
can assign it to your tenant. Without a name, the stack does not start.

5. Run the stack:

```shell
docker compose up
```

At the first start, the docker images will be downloaded. This might take some time. Subsequent starts will be faster.

Once the stack starts up, you will see a bunch of log output on your console.

6. Open the provided [sandbox.html](./sandbox.html) in your browser to operate the emulated locker facility.

7. Stop the stack with `Ctrl+C` when you're done.

## Logins

- **Logistics** (`http://localhost:5000`): user `api-dev`, password `api-dev` (HTTP Basic), tenant `variocube`.
- **Center API** (`http://localhost:7000`): applications authenticate with the consumer token `variocube.inhouse` and
  the application secret `variocube.inhouse`.
- **Center admin** (`http://localhost:7001`) signs in through Variocube's Keycloak, so it needs a Variocube account.

## Data

The sandboxes keep their data in Docker volumes: the databases and the cube's key survive stopping, restarting and
updating the stack.

`docker compose down -v` deletes the volumes. A local sandbox then starts from scratch. In Controller + App-Host, the
cube gets a new key, which Variocube's dev center rejects for the registered cube name: Variocube must reset the cube
before it can connect again.

## Updating

If you want to update to the latest version of Variocube services, change to the directory of your desired sandbox
and run:

```shell
docker compose pull
docker compose up
```

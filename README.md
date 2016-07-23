# Supervisor image running on Alpine Linux

A lightweight Docker image running [Supervisor][supervisor] on [Alpine Linux][alpine] to monitor processes.
Supervisor makes it easy to [run and monitor multiple processes][supervisor-run].

An `onbuild` image can be used to copy the `supervisord.conf` to container.

## Usage

Pulling the images from [Dockerhub]:

```sh
docker pull enil/alpine-supervisord
docker pull enil/alpine-supervisord-onbuild
```

`supervisord` needs a [configuration file][supervisor-config] to run, by default the container looks at
`/etc/supervisord.conf`.
A `Dockerfile` could look like this:

```Dockerfile
FROM enil/alpine-supervisord
COPY supervisord.conf /etc/supervisord.conf
```

Then build and run the image:

```sh
docker build -t mysupervisord .
docker run -d mysupervisord
```

The `enil/alpine-supervisord-onbuild` image simplifies the process by adding an `ONBUILD` task to copy a configuration
file called `supervisord.conf` in the same directory as the `Dockerfile`.
This further simplifies the `Dockerfile`:

```Dockerfile
FROM enil/alpine-supervisord
```
## Changelog

### `0.2`

* Upgrade Alpine Linux to v3.4
* Upgrade Python to v2.7.12
* Upgrade pip to v.8.1.2
* Upgrade Supervisor to v3.3.0

### `0.1.1`

* Change Dockerfile to 1.9 syntax to work on Dockerhub

### `0.1`

* Initial release

[supervisor]:        http://supervisord.org/
[supervisor-run]:    http://supervisord.org/running.html
[supervisor-config]: http://supervisord.org/configuration.html
[alpine]:            http://www.alpinelinux.org/
[dockerhub]:         https://hub.docker.com/


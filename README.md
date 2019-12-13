# pawn-env

[![sampctl](https://shields.southcla.ws/badge/sampctl-pawn--env-2f2f2f.svg?style=for-the-badge)](https://github.com/dakyskye/pawn-env)

Acces environment variables in PAWN

## Installation

Install to your project:

```bash
sampctl package install dakyskye/pawn-env
```

include in your code:

```c
#include <env>
```

and start using it.

## Usage

At development time, you can use `.env` file, but in production it's not recommended.

#### Example `.env` file content:

```env
MYSQL_USER=user
MYSQL_PASSWORD=password
MYSQL_HOST=localhost
MYSQL_DATABASE=database
```

#### Using it in the recommended way:

###### Bash

```bash
MYSQL_USER=user MYSQL_PASSWORD=password MYSQL_HOST=localhost MYSQL_DATABASE=database sampctl package run
```

###### PowerShell Core

```ps1
$env:MYSQL_USER="user"; $env:MYSQL_PASSWORD="password"; $env:MYSQL_HOST="localhost"; $env:MYSQL_DATABASE="database"; sampctl package run
```

###### Docker

```ps1
docker run -d \
    -e MYSQL_USER=user \
    -e MYSQL_PASSWORD=password \
    -e MYSQL_HOST=localhost \
    -e MYSQL_DATABASE=database \
    --name my-container my/image
```

## API

```cpp
native bool:Env_Has(const env[]);
native bool:Env_Get(const env[], dest[], size=sizeof(dest));
```

* `bool:Env_Has(const env[]);`

It checks if an environment variable with passed name as `env` exists or not and returns the result as `true` or `false`, hence the `bool` tag.

* `bool:Env_Get(const env[], dest[], size=sizeof(dest));`

It reads the value of the environment variable of passed name as `env`, then packs it into `dest`.


**Example usage** can be found in [tests/tests.pwn](https://github.com/dakyskye/pawn-env/tree/master/tests/tests.pwn)

## Building

First of all, install GNU Make if you haven't already.

###### Windows or Linux version on those machines

```ps1
make build
```

###### Linux version on Windows using Docker

```ps1
docker build -t pawn-env .
docker run -v DISKLETTER:\path\to\pawn-env\plugins:/pawn-env/plugins --name pawn-env pawn-env
```

An example path from my case: `X:\My-Workflow\pawn-env\plugins`

## Credits

* [Southclaws](https://github.com/Southclaws) - for inspiration (see his [pawn-env](https://github.com/Southclaws/pawn-env))
* [__SyS__](https://github.com/Sreyas-Sreelal) - for [boilerplate](https://github.com/Sreyas-Sreelal/rs-plugin-boilerplate)
* [ZOTTCE](https://github.com/ZOTTCE) - for [samp-rs](https://github.com/ZOTTCE/samp-rs)

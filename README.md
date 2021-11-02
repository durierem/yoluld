<div align="center">
  <h1>Yoluld</h1>
  <img src="https://robohash.org/yoluld/?set=set4" width="64">
  <p>
    <em>Daemon of the Yolul · Destroyer of Guilds · Chaotic Sheep's Herald</em>
  <p>
</div>

## About

Yoluld is a "fun" but useless Discord bot. Its primary purpose is to bring
**chaos** and **destruction** to your server! A bit like a cat... You know
these cute creatures that slowly push things out of the table? Yeah those
**demonic** animals. Hence the logo. And the name (the final *d* stands for
[daemon](https://en.wikipedia.org/wiki/Daemon_(computing))).
And the... stuff. And... Yeah... I don't know why I'm doing this...

## Features

- When someone joins a channel, join too and laugh dramatically >:]
- You can ping it and it will respond with pong! (probably the best feature yet)
- Easter egg (try random stuff or look at the code to find out)

For future features, see the
[project board](https://github.com/durierem/yoluld/projects/1).

## Usage

[Invitation link](https://discord.com/oauth2/authorize?&client_id=903022390303408158&scope=bot)

List of available commands, prefixed with `yoluld!` (more to come):

Command | Info
------- | ----
`help` | Display help about other commands
`ping` | Respond with "Pong!" and the latency in ms (told you it was best feature)

## Setup your own application

The simplest way to deploy the bot is to use the provided `Dockerfile` and
`docker-compose`. An example of `docker-compose.yml` is provided so you can
set up the appropriate environment variables.

Variable | Info
-------- | ----
`APP_ENV` | If set to `development`, load environment variables from `.env`. Can be pretty much anything. Not very useful. Fancy stuff.
`BOT_TOKEN` | The **bot** token that you can find on your application corresponding page on the Discord Developer Portal.
`BOT_ID` | The **application** (talk about naming things...) ID that you can also find on the Discord Developer Portal.
`BOT_PREFIX` | The prefix to use for commands. For example in `prefix!help` the prefix is `prefix!`.

Build the Docker image `docker build -t yoluld .` and start the container with
`docker-compose up`.

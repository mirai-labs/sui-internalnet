# Sui Internalnet

As a developer on Sui, have you ever felt the need for a network that combines the low latency and privacy of localnet with the ease of collaboration of a public devnet? **Sui Internalnet** is here to fill in that void!

**Sui Internalnet** lets you do the following:

1. Set up a private Sui network in one of 20+ regions around the world.
2. Provide access to individual developers on your team.
3. Allocate a public IP address to your Sui network to make it publicly accessible.

## Why an Internalnet is Useful

Let's briefly discuss why an internalnet is useful. Unless you're a solo developer, you've probably run into a situation where you want to provide a team member with access to a deployed package.

If you're working on localnet, you could use a tool like ngrok to expose your local network to the public Internet. While this may be the most convenient option, it comes with its own security tradeoffs and also requires your computer to be on 24/7. Furthermore, running a local instance of Sui on your computer can shorten the lifespan of your consumer-grade CPU and SSD. Another option would be deploying your package to devnet or testnet, but this also makes your package publicly visible, which you may not want for various reasons.

The ideal solution to this problem is a private network that can only be accessed by your team, and that's exactly what **Sui Internalnet** is.

## How it Works

**Sui Internalnet** is simple to use, almost too simple.

First, you'll need to create an account at [Fly.io](https://fly.io), and install `flyctl`.

Once `flyctl` has been installed, create a Fly app by running the command below. When prompted for an app name, you can either provide a name or let flyctl generate a random name.

```
fly apps create
```

Next, edit the provided `fly.toml` – replace <APP_NAME> with the name of your app and <PRIMARY_REGION> with the region code of the Fly region that's closest to you (you can view all the regions by running `fly platform regions`).

Finally, run the command below to deploy the app.

```
fly deploy --no-public-ips --flycast
```
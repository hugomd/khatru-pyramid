# Khatru Pyramid

A relay based on [Khatru](https://github.com/fiatjaf/khatru) with a invite hierarchy feature.

### Deploy with docker

```sh
docker run \
    -p 3334:3334 \
    -v ./users.json:/app/users.json \
    -v ./db:/app/db \
    -e DOMAIN="yourdomain.example.com" \
    -e RELAY_NAME="your relay name" \
    -e RELAY_PUBKEY="your nostr hex pubkey" \
    tijlxyz/khatru-pyramid:latest
```

### Deploy with

 - [YunoHost](https://github.com/YunoHost-Apps/khatru-pyramid_ynh) ([app catalog](https://apps.yunohost.org/app/khatru-pyramid))
 - [Cloudron](https://github.com/github-tijlxyz/khatru-pyramid_cloudron) ([app catalog pending](https://forum.cloudron.io/topic/11146/khatru-pyramid-a-nostr-relay))

### Manually build

#### Linux

```sh
git clone https://github.com/github-tijlxyz/khatru-pyramid && cd khatru-pyramid
just build
DOMAIN="example.com" RELAY_NAME="my relay" RELAY_PUBKEY=yourpubkey ./khatru-pyramid
```

#### macOS
```sh
. ./bin/activate-hermit
brew install entr
```

Update `users.json` with your nostr public key in hex:
```json
{
    "79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798": "79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798"
}
```


Run khatru pyramid:
```sh
just dev
```

Browse to http://0.0.0.0:3334/

### Configuration

Look at [example.env](./example.env) for all configuration options.

You can also manually edit the `users.json` file. Do this only when the server is down.
`users.json` is formatted as follows:
```json
{ "[user_pubkey_hex]": "[invited_by_pubkey_hex]" }
```


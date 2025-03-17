dev:
    fd 'go|templ' | entr -r bash -c 'just templ && godotenv go run .'

# Build with platform-specific settings
build: templ
    #!/usr/bin/env sh
    if [ "$(uname)" = "Darwin" ]; then
        go build -o ./khatru-pyramid
    else
        CC=musl-gcc go build -ldflags='-linkmode external -extldflags "-static"' -o ./khatru-pyramid
    fi

templ:
    templ generate

deploy target: build
    ssh root@{{target}} 'systemctl stop pyramid';
    scp khatru-pyramid {{target}}:pyramid/khatru-invite
    ssh root@{{target}} 'systemctl start pyramid'
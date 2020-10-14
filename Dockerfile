FROM elixir:1.10-alpine AS build

ARG MIX_ENV=prod

RUN mix local.hex --force
RUN mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config
COPY lib lib
COPY priv priv

RUN mix do deps.get, deps.compile
RUN mix release



FROM alpine:3.12

RUN apk add ncurses-libs

RUN mkdir /app
WORKDIR /app

COPY --from=build _build _build

CMD [ "_build/prod/rel/fenix/bin/fenix", "start" ]

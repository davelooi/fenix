FROM elixir:1.10-alpine

ENV MIX_HOME=/opt/mix

RUN mkdir /app
WORKDIR /app

COPY mix.exs mix.lock ./
COPY config config

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix do deps.get, deps.compile

COPY lib lib
COPY priv priv

CMD [ "mix", "phx.server" ]

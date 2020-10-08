FROM elixir:1.10-alpine

RUN mkdir /app
WORKDIR /app

COPY config/ ./config/
COPY mix.exs mix.lock ./

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

COPY lib/ ./lib/
COPY priv/ ./priv/
RUN mix do compile

CMD [ "mix", "phx.server" ]

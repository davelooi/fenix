FROM elixir:1.10-alpine

RUN mkdir /app
WORKDIR /app

COPY config/ ./config/
COPY mix.exs mix.lock ./

ENV MIX_ENV prod
ENV DATABASE_URL placeholder
ENV MAINTENANCE_DATABASE placeholder
ENV SECRET_KEY_BASE placeholder

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

COPY lib/ ./lib/
COPY priv/ ./priv/
RUN mix do compile

CMD [ "mix", "phx.server" ]

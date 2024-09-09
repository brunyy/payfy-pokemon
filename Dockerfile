FROM elixir:1.17.2 AS build

WORKDIR /app

ENV MIX_ENV=prod

RUN mix local.hex --force && mix local.rebar --force

COPY mix.exs mix.lock ./
RUN mix deps.get --only prod

COPY . .

RUN mix deps.compile
RUN mix compile

RUN mix release

FROM elixir:1.17.2 AS runtime

WORKDIR /app

COPY --from=build /app/_build/prod/rel/payfy_pokemon ./
COPY --from=build /app/config/runtime.exs /app/config/runtime.exs

ENV PORT=4000
EXPOSE 4000

CMD ["bin/payfy_pokemon", "start"]

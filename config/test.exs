use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :timesheets_spa, TimesheetsSpaWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :timesheets_spa, TimesheetsSpa.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "timesheets_spa_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :msqh_portal,
  ecto_repos: [MsqhPortal.Repo]

# Configures the endpoint
config :msqh_portal, MsqhPortal.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vAwQAmmuXrQs7iIvKwYIEpQMpoX5+10U8QTIA3GKEzb8qTr8/rBkPwCAUj+NX7pW",
  render_errors: [view: MsqhPortal.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MsqhPortal.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures ExAdmin
config :ex_admin,
  repo: MsqhPortal.Repo,
  module: MsqhPortal,
  modules: [
    MsqhPortal.ExAdmin.Dashboard,
    MsqhPortal.ExAdmin.User,
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

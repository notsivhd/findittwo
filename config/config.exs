# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :findit,
  ecto_repos: [Findit.Repo]

# Configures the endpoint
config :findit, Findit.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MrMhyQ/CL7m9HhSsJ//HKmNImoVY3JqwUGhGxsK9nT2h3cgp3aUcGmhrtYVPgAyw",
  render_errors: [view: Findit.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Findit.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :ex_admin,
   repo: Findit.Repo,
   module: Findit,
   modules: [
     Findit.ExAdmin.Dashboard,
     Findit.ExAdmin.User,
     Findit.ExAdmin.Object
   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%  
config :coherence,
  user_schema: Findit.User,
  repo: Findit.Repo,
  module: Findit,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:trackable, :invitable, :rememberable, :authenticatable, :recoverable, :lockable, :unlockable_with_token, :registerable]

config :coherence, Findit.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%

config :xain, :after_callback, {Phoenix.HTML, :raw}

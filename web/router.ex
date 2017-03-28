defmodule Findit.Router do
  use Findit.Web, :router
  use Coherence.Router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  pipeline :protected_admin do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
    plug Findit.Plugs.Authorized
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Add this block
  scope "/" do
    pipe_through :protected_admin
    coherence_routes :protected_admin
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Findit do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/objects", Findit do
    pipe_through :protected
    resources "/", ObjectController
  end

  scope "/admin", ExAdmin do
    pipe_through :protected_admin
    admin_routes
  end

  # Other scopes may use custom stacks.
  # scope "/api", Findit do
  #   pipe_through :api
  # end
end

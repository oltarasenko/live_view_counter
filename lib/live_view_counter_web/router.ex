defmodule LiveViewCounterWeb.Router do
  use LiveViewCounterWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(Phoenix.LiveView.Flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(:put_layout, {LiveViewCounterWeb.LayoutView, :app})
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", LiveViewCounterWeb do
    # Use the default browser stack
    pipe_through(:browser)

    # get("/", PageController, :index)
    live("/", CounterLive)
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveViewCounterWeb do
  #   pipe_through :api
  # end
end

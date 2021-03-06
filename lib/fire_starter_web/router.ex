defmodule FireStarterWeb.Router do
  use FireStarterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FireStarterWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/videos", VideoController, :index
    get "/videos/new", VideoController, :new
    post "/videos/post", VideoController, :create
    delete "/videos/:id", VideoController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", FireStarterWeb do
  #   pipe_through :api
  # end
end

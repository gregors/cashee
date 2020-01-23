defmodule CasheeWeb.Router do
  use CasheeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CasheeWeb do
    pipe_through :api

    get "/data/:key", DataController, :show
    put "/data/:key", DataController, :update
  end
end

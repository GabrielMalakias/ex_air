defmodule ExAirWeb.Router do
  use ExAirWeb, :router
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    post "/", ExAirWeb.CarbonIntensityController, :create
    get "/", ExAirWeb.CarbonIntensityController, :index
  end
end

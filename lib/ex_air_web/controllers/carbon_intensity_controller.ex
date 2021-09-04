defmodule ExAirWeb.CarbonIntensityController do
  use ExAirWeb, :controller

  def create(conn, params) do
    ExAir.Commands.ConsumeCarbonIntensities.call(params)

    send_resp(conn, 200, "")
  end

  def index(conn, _params) do
   render_index(conn, ExAir.Queries.CarbonIntensity.all)
  end

  defp render_index(records, conn) do
    render(conn, "index.json", records: records)
  end
end

defmodule ExAirWeb.CarbonIntensityView do
  use ExAirWeb, :view

  def render("index.json", %{records: records}) do
    %{data: render_many(records, ExAirWeb.CarbonIntensityView, "carbon_intensity.json")}
  end

  def render("carbon_intensity.json", %{record: record}) do
    %{id: record.id, forecast: record.forecast, actual: record.actual, index: record.index}
  end
end

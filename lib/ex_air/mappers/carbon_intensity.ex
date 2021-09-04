defmodule ExAir.Mappers.CarbonIntensity do
  require Logger
  alias ExAir.Converter

  def from_http_to_model(map) do
    %{
      id: map["from"] |> to_iso! |> DateTime.to_unix,
      forecast: map["intensity"]["forecast"],
      actual: map["intensity"]["actual"],
      index: map["intensity"]["index"],
      from: to_iso!(map["from"]),
      to: to_iso!(map["to"])
    }
  end

  def to_iso!(text) do
    text |> Converter.to_iso8601! |> Converter.from_iso8601!
  end
end

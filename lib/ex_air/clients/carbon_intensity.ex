defmodule ExAir.Clients.CarbonIntensity do
  require Logger

  @base_path "https://api.carbonintensity.org.uk/intensity"

  def get(from, to) do
    case HTTPoison.get(build_url(from, to), headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Logger.info(body)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp build_url(from, to), do: "#{@base_path}/#{DateTime.to_iso8601(from)}/#{DateTime.to_iso8601(to)}"

  defp headers, do: ["Accept": "application/json"]
end

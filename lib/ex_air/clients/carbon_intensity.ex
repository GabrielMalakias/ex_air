defmodule ExAir.Clients.CarbonIntensity do
  require Logger
  @base_path "https://api.carbonintensity.org.uk/intensity"

  def get(from, to) do
    case HTTPoison.get(build_url(from, to), headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"data"=> records} = Jason.decode!(body)
        records
      {:ok, %HTTPoison.Response{status_code: 404}} -> Logger.error("NotFound")
      {:error, %HTTPoison.Error{reason: reason}} -> Logger.error(inspect(reason))
    end
  end

  defp build_url(from, to), do: "#{@base_path}/#{DateTime.to_iso8601(from)}/#{DateTime.to_iso8601(to)}"

  defp headers, do: ["Accept": "application/json"]
end

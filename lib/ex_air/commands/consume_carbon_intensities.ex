defmodule ExAir.Commands.ConsumeCarbonIntensities do
  require Logger

  def call(params) do
    from = parse_datetime(params["from"])
    to = parse_datetime(params["to"])

    from
    |> build_datablocks(to, [])
    |> Enum.sort(&DateTime.compare(&1, &2) != :gt)
    |> execute
  end

  def execute(datablocks) do
    Enum.map_reduce(datablocks, 0, fn datetime, acc -> {
      start_task(Enum.at(datablocks, acc), Enum.at(datablocks, acc + 1)), acc + 1
    } end)
  end

  def start_task(from, to) when is_nil(to), do: :nothing

  def start_task(from, to) do
    Task.Supervisor.async(ExAir.TaskSupervisor, fn ->
      ExAir.Clients.CarbonIntensity.get(from, to)
    end)
  end

  def build_datablocks(from, to, acc) do
    acc = [from | acc]
    new_from = increment(from)

    case DateTime.compare(to, new_from) do
      :gt ->
        build_datablocks(new_from, to, acc)
      _ -> acc
    end
  end

  defp increment(time) do
    DateTime.add(time, 1800, :second)
  end

  defp parse_datetime(text) do
    {:ok, datetime, _} =  DateTime.from_iso8601(text)
    datetime
  end
end

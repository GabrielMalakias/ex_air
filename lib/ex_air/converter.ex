defmodule ExAir.Converter do
  def from_iso8601!(text) do
    {:ok, datetime, _} =  DateTime.from_iso8601(text)
    datetime
  end

  def to_iso8601!(text) do
   [date, time] = String.split(text, "T")

   "#{date}T#{String.replace(time, "Z", "")}:00Z"
  end
end

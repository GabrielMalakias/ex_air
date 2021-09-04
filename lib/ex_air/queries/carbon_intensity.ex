defmodule ExAir.Queries.CarbonIntensity do
  def all do
    ExAir.Repo.all(ExAir.CarbonIntensity)
  end
end

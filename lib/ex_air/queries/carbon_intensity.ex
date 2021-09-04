defmodule ExAir.Queries.CarbonIntensity do
  import Ecto.Query, only: [from: 2]

  def all do
    ExAir.Repo.all(ExAir.CarbonIntensity)
  end

  def find_or_new(%{id: id}) do
    case ExAir.Repo.one(from c in ExAir.CarbonIntensity, where: c.id == ^id) do
      nil  -> %ExAir.CarbonIntensity{id: id}
      record -> record
    end
  end
end

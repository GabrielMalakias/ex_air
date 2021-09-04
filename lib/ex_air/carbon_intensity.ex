defmodule ExAir.CarbonIntensity do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  schema "carbon_intensities" do
    field :forecast, :integer
    field :actual, :integer
    field :index, :integer
  end
end

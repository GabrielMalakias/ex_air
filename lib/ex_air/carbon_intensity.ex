defmodule ExAir.CarbonIntensity do
  use Ecto.Schema

  @primary_key {:id, :integer, []}
  @required_args [:id, :forecast, :actual, :index, :from, :to]

  schema "carbon_intensities" do
    field :forecast, :integer
    field :actual, :integer
    field :index, :string
    field :from, :utc_datetime
    field :to, :utc_datetime
  end

  def changeset(params) do
    %ExAir.CarbonIntensity{}
    |> Ecto.Changeset.cast(params, @required_args)
  end
end

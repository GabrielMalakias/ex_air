defmodule ExAir.CarbonIntensity do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  @required_args [:id, :forecast, :actual, :index, :from, :to]

  schema "carbon_intensities" do
    field :forecast, :integer
    field :actual, :integer
    field :index, :string
    field :from, :utc_datetime
    field :to, :utc_datetime
  end

  def changeset(model, params) do
    model
    |> cast(params, @required_args)
    |> unique_constraint(:id)
  end
end

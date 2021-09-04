defmodule ExAir.Repo.Migrations.CreateCarbonIntensity do
  use Ecto.Migration

  def change do
    create table(:carbon_intensities, primary_key: false) do
      add :id, :integer
      add :forecast, :integer
      add :actual, :integer
      add :index, :string
      add :from, :utc_datetime
      add :to, :utc_datetime
    end
    create unique_index(:carbon_intensities, [:id])
  end
end

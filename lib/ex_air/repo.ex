defmodule ExAir.Repo do
  use Ecto.Repo,
    otp_app: :ex_air,
    adapter: Ecto.Adapters.Postgres
end

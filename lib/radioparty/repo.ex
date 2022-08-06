defmodule Radioparty.Repo do
  use Ecto.Repo,
    otp_app: :radioparty,
    adapter: Ecto.Adapters.Postgres
end

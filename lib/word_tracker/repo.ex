defmodule WordTracker.Repo do
  use Ecto.Repo,
    otp_app: :word_tracker,
    adapter: Ecto.Adapters.Postgres
end

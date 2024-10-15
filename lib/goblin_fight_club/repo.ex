defmodule GoblinFightClub.Repo do
  use Ecto.Repo,
    otp_app: :goblin_fight_club,
    adapter: Ecto.Adapters.Postgres
end

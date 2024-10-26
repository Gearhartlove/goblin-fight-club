defmodule GoblinFightClub.Repo do
  use Ecto.Repo,
    otp_app: :goblin_fight_club,
    adapter: Ecto.Adapters.Postgres

  import Ecto.Query

  def query_monsters_by_level(levels) do
    unique_levels = Enum.uniq(levels)

    all(
      from m in GoblinFightClub.Monster,
        where: m.level in ^unique_levels,
        order_by: [asc: m.level]
    )
  end
end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GoblinFightClub.Repo.insert!(%GoblinFightClub.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias GoblinFightClub.{Repo, Monster}

all_monsters =
  Path.wildcard("priv/static/pathfinder-bestiary/*.json")
  |> Enum.map(&File.read!(&1))
  |> IO.inspect(label: "After reading file")
  |> Enum.map(&Jason.decode!(&1))
  |> IO.inspect(label: "After decoding json")
  |> Enum.map(
    &%{name: get_in(&1, ["name"]), level: get_in(&1, ["system", "details", "level", "value"])}
  )
  |> IO.inspect(label: "After grabbing data")

Enum.each(all_monsters, fn monster ->
  %Monster{}
  |> Monster.changeset(monster)
  |> Repo.insert!()
end)

IO.puts("Fin")

defmodule GoblinFightClub.Setup do
  alias GoblinFightClub.{Monster, Repo}

  @doc """
  Add's the monster's to the database
  """
  def seed(path \\ "priv/static/pathfinder-bestiary/*.json") do
    all_monsters =
      Path.wildcard(path)
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
  end
end

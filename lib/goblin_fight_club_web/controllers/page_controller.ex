defmodule GoblinFightClubWeb.PageController do
  use GoblinFightClubWeb, :controller

  def home(conn, params) do
    defaults = %{
      "player_count" => 4,
      "party_level" => 5,
      "selected_difficulty" => "Trivial",
      "selected_group_kind" => "Boss and Lackeys"
    }

    # ensure that player_count and party_level are integers when loaded into params
    params =
      params
      |> Enum.map(fn {key, value} ->
        if key in ["player_count", "party_level"] do
          {key, parse_integer(value)}
        else
          {key, value}
        end
      end)
      |> Enum.into(%{})

    params = Map.merge(defaults, params)

    assigns = %{
      player_count: parse_integer(params["player_count"]),
      party_level: parse_integer(params["party_level"]),
      selected_group_kind: params["selected_group_kind"],
      group_kinds: html_group_kinds(params["selected_group_kind"]),
      selected_difficulty: params["selected_difficulty"],
      difficulties: html_difficulties(params["selected_difficulty"]),
      generated_encounter: generate_encounter(params),
      layout: false,
    }

    render(conn, :index, assigns)
  end

  defp html_group_kinds(selected) do
    [
      "Boss and Lackeys",
      "Boss and Lieutenant",
      "Elite Enemies",
      "Lieutenant and Lackeys",
      "Mated Pair",
      "Troop",
      "Mook Squad"
    ]
    |> Enum.map(fn group_kind ->
      if group_kind == selected do
        "<option selected> #{group_kind} </option>"
      else
        "<option> #{group_kind} </option>"
      end
    end)
  end

  defp html_difficulties(selected) do
    [
      "Trivial",
      "Low",
      "Moderate",
      "Severe",
      "Extreme"
    ]
    |> Enum.map(fn difficulty ->
      if difficulty == selected do
        "<option selected> #{difficulty} </option>"
      else
        "<option> #{difficulty} </option>"
      end
    end)
    |> Enum.join("\n")
  end

  defp parse_integer(value) when is_integer(value), do: value
  defp parse_integer(value) when is_binary(value), do: String.to_integer(value)

  defp generate_encounter(%{
         "player_count" => player_count,
         "party_level" => party_level,
         "selected_group_kind" => group_kind,
         "selected_difficulty" => difficulty
       }) do
    # calculate monsters counts and levels
    monster_count_and_relative_levels =
      case group_kind do
        "Boss and Lackeys" ->
          [
            %{count: 1, relative_level: party_level + 2},
            %{count: 4, relative_level: party_level - 4}
          ]

        "Boss and Lieutenant" ->
          [%{count: 1, relative_level: party_level + 2}, %{count: 1, relative_level: party_level}]

        "Elite Enemies" ->
          [%{count: 3, relative_level: party_level}]

        "Lieutenant and Lackeys" ->
          [%{count: 1, relative_level: party_level}, %{count: 4, relative_level: party_level - 4}]

        "Mated Pair" ->
          [%{count: 2, relative_level: party_level}]

        "Troop" ->
          [%{count: 1, relative_level: party_level}, %{count: 2, relative_level: party_level - 2}]

        "Mook Squad" ->
          [%{count: 6, relative_level: party_level - 4}]
      end

    level_to_monsters =
      monster_count_and_relative_levels
      |> IO.inspect(label: "Monster count and relative levels")
      |> Enum.map(fn monster -> monster[:relative_level] end)
      |> Enum.uniq()
      |> IO.inspect(label: "Unique levels")
      |> Enum.map(fn level -> {level, GoblinFightClub.Repo.query_monsters_by_level([level])} end)
      |> Enum.into(%{})

    IO.puts("Monsters by level: #{inspect(level_to_monsters)}")

    monster_count_and_relative_levels
    # select monsters randomly per level
    |> Enum.flat_map(fn %{count: count, relative_level: level} ->
      monsters = Map.get(level_to_monsters, level)
      Enum.take_random(monsters, count)
    end)
    |> IO.inspect(label: "after select monsters randomly")
    # render the monsters
    |> Enum.map(fn monster -> "<p>#{monster.name} <span class='text-sm italic'>level #{monster.level}</span><\p>" end)
    |> Enum.join("\n")
  end
end

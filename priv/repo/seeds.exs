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

# Read the Json File
# {:ok, json_content} = File.read("../static/assets/pathfinder-bestiary/owlbear.json")
# get all files in a directory 

file_path =  "priv/static/assets/pathfinder-bestiary/owlbear.json"

{:ok, json_content} = File.read(file_path)
{:ok, data} = Jason.decode(json_content)
data = %{
  name: get_in(data, ["name"]), 
  level: get_in(data, ["system", "details", "level", "value"])
}

changeset = Monster.changeset(%Monster{}, data)

result = Repo.insert!(changeset)

IO.inspect result

# Insert the data into the database
# Enum.each(data, fn item ->
  #  %Monster.changeset(item)
  #|> MySchema.changeset(item)
#|> Repo.insert!()
#end)



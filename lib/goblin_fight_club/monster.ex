defmodule GoblinFightClub.Monster do
  use Ecto.Schema
  import Ecto.Changeset

  schema "monsters" do
    field :name, :string
    field :level, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(monster, attrs) do
    monster
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
  end
end

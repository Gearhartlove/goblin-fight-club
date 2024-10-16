defmodule GoblinFightClub.Repo.Migrations.CreateMonsters do
  use Ecto.Migration

  def change do
    create table(:monsters) do
      add :name, :string
      add :level, :integer

      timestamps(type: :utc_datetime)
    end
  end
end

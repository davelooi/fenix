defmodule Fenix.Repo.Migrations.CreateCounters do
  use Ecto.Migration

  def change do
    create table(:counters) do
      add :key, :string
      add :counter, :integer

      timestamps()
    end

    create unique_index(:counters, [:key])
  end
end

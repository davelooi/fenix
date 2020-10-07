defmodule Fenix.Counter do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "counters" do
    field :counter, :integer
    field :key, :string

    timestamps()
  end

  @doc false
  def changeset(counter, attrs) do
    counter
    |> cast(attrs, [:key, :counter])
    |> validate_required([:key, :counter])
    |> validate_length(:key, min: 3)
  end

  def reload(%module{id: id}) do
    Fenix.Repo.get(module, id)
  end

  def find_and_inc(key) do
    counter = Fenix.Repo.one!(from c in Fenix.Counter, where: c.key == ^key)

    counter
    |> Fenix.Counter.changeset(%{counter: counter.counter + 1})
    |> Fenix.Repo.update()
    |> case do
      {:ok, counter} -> reload(counter)
    end
  end
end

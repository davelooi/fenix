defmodule Fenix.Counter do
  use Ecto.Schema
  import Ecto.Changeset

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
end

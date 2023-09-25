defmodule Project1Sqlite.Furniture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "furniture" do
    field :name, :string
    field :furnituretype, :string
    field :material, :string

    timestamps()
  end

  def changeset(furniture, attrs) do
    furniture
    |> cast(attrs, [:name, :furnituretype, :material])
    |> validate_required([:name, :furnituretype, :material])
  end
end

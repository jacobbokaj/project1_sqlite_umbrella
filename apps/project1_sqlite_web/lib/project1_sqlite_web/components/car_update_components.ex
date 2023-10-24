defmodule Project1SqliteWeb.CarUpdateComponents do
  use Phoenix.Component

  attr(:car_id, :string, required: true)
  attr(:brand, :string, required: true)
  attr(:model, :string, required: true)
  attr(:year, :string, required: true)
  attr(:price, :string, required: true)

  def update_car(assigns) do
    ~H"""
    <input type="number" name={@car_id} placeholder="Car id" />
    <input type="text" name={@brand} placeholder="Brand" />
    <input type="text" name={@model} placeholder="Model" />
    <input type="number" name={@year} placeholder="Year" />
    <input type="number" name={@price} placeholder="Price" />
    """
  end
end

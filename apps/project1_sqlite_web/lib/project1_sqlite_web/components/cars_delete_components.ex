defmodule Project1SqliteWeb.CarsDeleteComponents do
  use Phoenix.Component



  attr(:id,:string, required: true)
  attr(:name,:string, required: true)

  def car_id_input(assigns) do
    ~H"""
      <input type="number" id={@id} name={@name} placeholder="Car id" />
    """
  end

end

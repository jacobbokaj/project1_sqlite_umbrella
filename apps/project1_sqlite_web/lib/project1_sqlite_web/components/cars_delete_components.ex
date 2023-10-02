defmodule Project1SqliteWeb.CarsDeleteComponents do
  use Phoenix.Component

  alias Project1SqliteWeb.ButtonComponents

  def pf_input(assigns) do
    ~H"""
    <div>
      <label>id</label>
      <input id={@id} type="number" value={@car_id}/>
    </div>

    """
  end

end

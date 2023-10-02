defmodule Project1SqliteWeb.CarsDeleteComponent do
  use Project1SqliteWeb, :live_component

  alias Project1SqliteWeb.CarsDeleteComponents
  alias Project1SqliteWeb.ButtonComponents


  attr(:id, :integer, required: true)
  attr(:car_id, :integer, required: true)
  def render(assigns) do
    ~H"""
    <div class="box-border h-32 w-41 p-2 border-4 ...">
      <form>

        <CarsDeleteComponents.pf_input id={@id} car_id={@car_id}/>
        <input type="submit" value="Submit here " phx-click="delete_cars" phx-target={@myself} phx-value-car_id={@car_id}>


    </form>
    </div>
    """
  end

  def handle_event("delete_cars",_params, socket) do
    IO.puts("id hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee:")
    socket = assign(socket,car_id: "")
    {:noreply,socket}
  end


end

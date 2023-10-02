defmodule Project1SqliteWeb.CarsDeleteComponent do
  use Project1SqliteWeb, :live_component

  alias Project1SqliteWeb.CarsDeleteComponents
  alias Project1SqliteWeb.ButtonComponents


  attr(:id, :integer, required: true)
  def render(assigns) do
    ~H"""
    <div class="box-border h-32 w-41 p-2 border-4 ...">

      <form phx-submit="delete_cars" phx-target={@myself}>

        <CarsDeleteComponents.car_id_input  id="car_id" name="car_id"/>
        <ButtonComponents.btn_simple type="submit" btn_text="Submit here"/>

      </form>
    </div>
    """
  end

  def handle_event("delete_cars",%{"car_id" => car_id}, socket) do
    #response_car_list =
    socket = assign(socket,car_id: "")
    {:noreply,socket}
  end


end

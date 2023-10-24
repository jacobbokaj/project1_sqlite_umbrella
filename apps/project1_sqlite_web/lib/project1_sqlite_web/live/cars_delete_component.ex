defmodule Project1SqliteWeb.CarsDeleteComponent do
  use Project1SqliteWeb, :live_component

  alias Project1SqliteWeb.{CarsDeleteComponents, ButtonComponents}
  alias Project1Sqlite.CarsContext

  attr(:id, :integer, required: true)

  def render(assigns) do
    ~H"""
    <div class="box-border h-32 w-41 p-2 border-4 ...">
      <form phx-submit="delete_cars" phx-target={@myself}>
        <CarsDeleteComponents.car_id_input name="car_id" />
        <ButtonComponents.btn_simple type="submit" btn_text="Delete car" />
      </form>
    </div>
    """
  end

  def handle_event("delete_cars", %{"car_id" => car_id}, socket) do
    CarsContext.delete_cars_with_condition("id", car_id)

    socket = assign(socket, car_id: "")
    {:noreply, socket}
  end
end

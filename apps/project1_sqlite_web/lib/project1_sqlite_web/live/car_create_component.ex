defmodule Project1SqliteWeb.CarCreateComponent do
  use Project1SqliteWeb, :live_component

  alias Project1SqliteWeb.ButtonComponents
  alias Project1SqliteWeb.CarCreateComponents
  alias Project1Sqlite.CarsContext
  def render(assigns) do
    ~H"""
      <div class="box-border h-48 w-42 p-2 border-5 ...">

        <form phx-submit="create_car" phx-target={@myself}>
          <CarCreateComponents.create_car
            car_id="car_id"
           brand="brand"
           model="model"
           year="year"
           price="price"
          />
          <ButtonComponents.btn_simple type="submit" btn_text="create car"/>
        </form>

      </div>
    """
  end

  def handle_event("create_car", %{"car_id" => car_id, "brand" => brand, "model" => model,
    "year" => year, "price" => price}, socket) do
    CarsContext.create_car(car_id,brand,model,year,price)
      {:noreply,socket}
  end
end

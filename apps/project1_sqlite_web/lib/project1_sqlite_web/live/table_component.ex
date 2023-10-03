defmodule Project1SqliteWeb.TableComponent do
  use Project1SqliteWeb, :live_component


  alias Project1Sqlite.CarsContext
  alias Project1SqliteWeb.TableComponents
  alias Project1SqliteWeb.ButtonComponents

  attr(:cars, :list, required: true)
  attr(:car_name, :string, required: true)
  def render(assigns) do
    ~H"""
      <div class="box-border h-32 w-41 p-2 border-4 ...">
        <ButtonComponents.cars_show_button
          type="button"
          phx_click_name="show_cars"
          myself={@myself}
          btn_text="show cars"
        />
        <TableComponents.table_car
          cars={@cars}
          car_name={@car_name}
          take_car="take_car"
          myself={@myself}
          />
      </div>
    """

  end

  def handle_event("show_cars", _unsigned_params, socket) do

    car_list_response = CarsContext.get_cars()
    car_taget = Enum.at(car_list_response,1)

  car_list_reverse = Enum.reverse(car_list_response)

  {:noreply, assign(socket, cars: car_list_reverse,car_name: Enum.at(car_taget,1))}
  end

end

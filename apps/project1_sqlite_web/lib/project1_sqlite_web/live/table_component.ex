defmodule Project1SqliteWeb.TableComponent do
  use Project1SqliteWeb, :live_component


  alias Project1Sqlite.CarsContext
  alias Project1SqliteWeb.TableComponents
  alias Project1SqliteWeb.ButtonComponents
 # def mount(_params, _session, socket) do
 #   {:ok,
 #   socket
 #   |> assign(cars: [])
 #   |> assign(car_name: "")
 # }
 # end

  attr(:cars, :list, required: true)
  attr(:car_name, :string, required: true)
  def render(assigns) do
    ~H"""
      <div>
        <ButtonComponents.cars_show_button
          type="button"
          click_name="show_cars"
          myself={@myself}
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

  def handle_event("take_car",%{"index" => index} , socket) do

    car_list_response = socket.assigns[:cars]
    car_taget = Enum.at(car_list_response,String.to_integer(String.to_integer(index) + 1))

    {:noreply,
    socket
    |> assign(car_name: Enum.at(car_taget,1))

  }
  end

  def handle_event("show_cars", _unsigned_params, socket) do

    car_list_response = CarsContext.get_cars()
    car_taget = Enum.at(car_list_response,1)

  car_list_reverse = Enum.reverse(car_list_response)

  {:noreply, assign(socket, cars: car_list_reverse,car_name: Enum.at(car_taget,1))}
  end

end

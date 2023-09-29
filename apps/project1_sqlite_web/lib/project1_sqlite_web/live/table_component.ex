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
        click_name="show_car"
        myself={@myself}
      />
      <TableComponents.table_car cars={@cars} car_name={@car_name}/>
      </div>
    """

  end

  def handle_event("take_car",%{"index" => index} , socket) do

    response = CarsContext.get_cars_with_condition("id",String.to_integer(index) + 1)

    car_list = Enum.reduce(response.rows, [], fn row, acc ->
      [row | acc]
     end)

    car_taget = Enum.at(car_list,0)
    IO.puts("car_target here: #{inspect(car_taget)}")

    {:noreply,
    socket
    |> assign(car_name: Enum.at(car_taget,1))

  }
  end

  def handle_event("show_car", _unsigned_params, socket) do

  response = CarsContext.get_cars()

  car_list = Enum.reduce(response.rows, [], fn row, acc ->
   [row | acc]
  end)

  car_list_reverse = Enum.reverse(car_list)

  {:noreply, assign(socket, cars: car_list_reverse)}
  end

end

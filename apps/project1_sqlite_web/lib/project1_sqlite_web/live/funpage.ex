defmodule Project1SqliteWeb.Funpage do
  use Project1SqliteWeb, :live_view

  alias Project1Sqlite.CarsContext

  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(cars: [])
    |> assign(car_name: "")
  }
  end



  def render(assigns) do
    ~H"""
        <button phx-click="show_car" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">Show car</button>
        <h2>car_name here <%= @car_name %> </h2>
        <table class="border-separate border-spacing-2 border border-slate-500">
          <thead>
            <tr>
              <th class="border border-slate-600">Id</th>
              <th class="border border-slate-600">Brand</th>
              <th class="border border-slate-600">Model</th>
              <th class="border border-slate-600">Year</th>
              <th class="border border-slate-600">Price</th>
            </tr>
          </thead>
          <tbody>
            <%= for {row, index} <- Enum.with_index(@cars) do %>
              <tr>
                <td phx-click="take_car" phx-value-index={index} class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"><%= check_list(row, 0) %></td>
                <td class="border border-slate-700"><%= check_list(row,1) %></td>
                <td class="border border-slate-700"><%= check_list(row, 2) %></td>
                <td class="border border-slate-700"><%= check_list(row, 3) %></td>
                <td class="border border-slate-700"><%= check_list(row, 4) %></td>
              </tr>
            <% end %>
          </tbody>
        </table>
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

  defp check_list(cars,index) do
    if Enum.empty?(cars) do
      ""
    else
      Enum.at(cars,index)
    end
  end

end

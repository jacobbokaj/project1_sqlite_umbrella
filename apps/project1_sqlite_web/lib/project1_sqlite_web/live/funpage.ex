defmodule Project1SqliteWeb.Funpage do
  use Project1SqliteWeb, :live_view


  def mount(_params, _session, socket) do
    {:ok,
    socket
    |> assign(cars: [])
    |> assign(car_name: "")
    |> assign(car_id: -1)
  }
  end

  def render(assigns) do
    ~H"""
      <.live_component
        module={Project1SqliteWeb.CarsDeleteComponent}
        id="cars_modify"
        car_id={@car_id}
        />
      <.live_component
        module={Project1SqliteWeb.TableComponent}
        id="car_table"
        cars={@cars}
        car_name={@car_name}
      />
    """

  end


end

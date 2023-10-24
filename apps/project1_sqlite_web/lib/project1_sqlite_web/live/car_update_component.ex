defmodule Project1SqliteWeb.CarUpdateComponent do
  use Project1SqliteWeb, :live_component
  alias Project1Sqlite.CarsContext
  alias Project1SqliteWeb.{CarUpdateComponents, ButtonComponents}

  def render(assigns) do
    ~H"""
    <div class="box-border h-48 w-42 p-2 border-5 ...">
      <form phx-submit="create_car" phx-target={@myself}>
        <CarUpdateComponents.update_car
          car_id="car_id"
          brand="brand"
          model="model"
          year="year"
          price="price"
        />
        <ButtonComponents.btn_simple type="submit" btn_text="create car" />
      </form>
    </div>
    """
  end

  def car_update(
        table_name,
        car_id,
        update_id,
        update_brand,
        update_model,
        update_year,
        update_price
      ) do
  end

  def cars_filter_ids() do
  end

  def handle_event("cars_filter_ids", _params, socket) do
  end
end

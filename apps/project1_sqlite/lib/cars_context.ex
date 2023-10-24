defmodule Project1Sqlite.CarsContext do
  alias Project1Sqlite.CarsQueries

  def get_cars() do
    response = CarsQueries.select_cars()
    response_atom = elem(response, 0)

    case response_atom do
      :ok ->
        cars_sqlite = elem(response, 1)

        Enum.reduce(cars_sqlite.rows, [], fn row, acc ->
          [row | acc]
        end)

      :error ->
        :error
    end
  end

  def get_cars_with_condition(colum, condition_value) do
    response = CarsQueries.select_cars_where(colum, condition_value)
    response_atom = elem(response, 0)

    case response_atom do
      :ok ->
        cars_sqlite = elem(response, 1)

        Enum.reduce(cars_sqlite.rows, [], fn row, acc ->
          [row | acc]
        end)

      :error ->
        :error
    end
  end

  def create_car(id, brand, model, year, price) do
    response = CarsQueries.insert_car(id, brand, model, year, price)
    IO.inspect("deleting car: #{inspect(response)}")
    elem(response, 0)
  end

  def delete_cars_with_condition(condition, condition_value) do
    response = CarsQueries.delete_cars_where(condition, condition_value)
    response_atom = elem(response, 0)

    case response_atom do
      :ok -> elem(response, 1)
      :error -> :error
    end
  end

  def update_cars_with_condition(condition, condition_value) do
    response = CarsQueries.delete_cars_where(condition, condition_value)
    response_atom = elem(response, 0)

    case response_atom do
      :ok -> elem(response, 1)
      :error -> :error
    end
  end
end

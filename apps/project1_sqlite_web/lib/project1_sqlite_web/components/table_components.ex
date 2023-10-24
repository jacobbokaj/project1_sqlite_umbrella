defmodule Project1SqliteWeb.TableComponents do
  use Phoenix.Component

  attr(:cars, :list, required: true)
  attr(:car_name, :string, required: true)
  attr(:take_car, :string, required: true)
  attr(:myself, :string, required: true)

  def table_car(assigns) do
    ~H"""
    <div>
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
              <td class="border border-slate-700"><%= check_list(row, 0) %></td>
              <td class="border border-slate-700"><%= check_list(row, 1) %></td>
              <td class="border border-slate-700"><%= check_list(row, 2) %></td>
              <td class="border border-slate-700"><%= check_list(row, 3) %></td>
              <td class="border border-slate-700"><%= check_list(row, 4) %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end

  defp check_list(objects, index) do
    if Enum.empty?(objects) do
      ""
    else
      Enum.at(objects, index)
    end
  end
end

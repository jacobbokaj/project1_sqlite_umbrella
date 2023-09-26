defmodule Project1SqliteWeb.Funpage do
  use Project1SqliteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,assign(socket,cars: [%{}])}
  end
  def render(assigns) do
    ~H"""

<button phx-click="show_car" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" >Show car</button>



      <h1>Looping</h1>
      <table class="border-separate border-spacing-2 border border-slate-500 ...">
        <thead>
          <tr>
            <th class="border border-slate-600 ...">Id</th>
            <th class="border border-slate-600 ...">Brand</th>
            <th class="border border-slate-600 ...">Model</th>
            <th class="border border-slate-600 ...">Year</th>
            <th class="border border-slate-600 ...">Price</th>
          </tr>
        </thead>
        <tbody>
          <%= for {car,index} <- Enum.with_index(Map.get(assigns, :cars, [])) do %>
            <tr>
              <td phx-click="take_car" phx-value-index={index} class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"><%= car["id"] %></td>
              <td class="border border-slate-700 ..."><%= car["name"] %></td>
              <td class="border border-slate-700 ..."><%= car["type"] %></td>
              <td class="border border-slate-700 ..."><%= car["available"] %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
      <h2><%= @car_take %> </h2>
    """
  end
end

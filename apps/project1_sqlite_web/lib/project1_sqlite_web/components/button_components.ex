defmodule Project1SqliteWeb.ButtonComponents do
  use Phoenix.Component

  def cars_show_button(assigns) do
    ~H"""
    <button
    type={@type}
    phx-click={@click_name}
    phx-target={@myself}
    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
    >

    Show car</button>
    """
  end
end

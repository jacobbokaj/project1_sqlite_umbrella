defmodule Project1SqliteWeb.ButtonComponents do
  use Phoenix.Component


  attr(:type,:string,required: true)
  attr(:phx_click_name,:string,required: true)
  attr(:myself,:string,required: true)
  attr(:btn_text,:string,required: true)
  def cars_show_button(assigns) do
    ~H"""
    <button
    type={@type}
    phx-click={@phx_click_name}
    phx-target={@myself}
    class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
    >

    <%= @btn_text %></button>
    """
  end

  def cars_delete_button(assigns) do

  end
end

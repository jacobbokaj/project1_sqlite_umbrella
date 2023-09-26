defmodule Project1SqliteWeb.Funpage do
  use Project1SqliteWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,socket}
  end
  def render(assigns) do
    ~H"""

    <h2> Hejsa </h2>
    """
  end
end

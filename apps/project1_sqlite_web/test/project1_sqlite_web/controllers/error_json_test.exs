defmodule Project1SqliteWeb.ErrorJSONTest do
  use Project1SqliteWeb.ConnCase, async: true

  test "renders 404" do
    assert Project1SqliteWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Project1SqliteWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end

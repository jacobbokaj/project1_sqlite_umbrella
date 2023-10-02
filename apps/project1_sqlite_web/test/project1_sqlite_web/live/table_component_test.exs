defmodule Project1SqliteWeb.TableComponentTest do
  use ExUnit.Case
  use Pheonix.LiveViewTest
  alias Project1SqliteWeb.TableComponent

  describe "Testing TableComponent" do
    test "it renders with elements" do
      # Opret en live view socket
      {:ok, _, html} = live(TableComponent, assigns: %{
        cars: [%{id: 1, name: "Car 1"}, %{id: 2, name: "Car 2"}],
        car_name: "Selected Car"
      })

      # Bekræft, at HTML indeholder de forventede elementer
      assert html =~ "show cars"
      assert html =~ "take_car"
      assert html =~ "Selected Car"
    end
  end
end

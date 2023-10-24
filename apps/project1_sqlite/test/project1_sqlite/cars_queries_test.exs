Ecto.Adapters.SQL.Sandbox.mode(Project1Sqlite.Repo, :manual)

defmodule Project1Sqlite.CarsQueriesTest do
  # mix test apps/project1_sqlite/test/project1_sqlite/cars_queries_test.ex
  use ExUnit.Case

  alias Project1Sqlite.CarsQueries

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Project1Sqlite.Repo)
  end

  describe "Cars CRUD" do
    test "Select cars" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "CREATE TABLE cars(id,brand,model,year,price)")
      CarsQueries.insert_car(1, "brandtest", "modeltest", 1021, 9999)

      response = CarsQueries.select_cars()
      assert elem(response, 0) == :ok
    end

    test "Insert into cars. Should succes" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "CREATE TABLE cars(id,brand,model,year,price)")
      response = CarsQueries.insert_car(1, "brandtest", "modeltest", 1021, 9999)
      assert elem(response, 0) == :ok
    end

    #  test "Insert into cars. Should fail" do
    #  Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
    # response = CarsQueries.insert_car('1',"brandtest","modeltest",1021,9999)
    #  IO.puts("Insert should fail: #{inspect(response)}")
    # assert elem(response,0) == :error
    # end

    test "Select cars where. Should succes" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "CREATE TABLE cars(id,brand,model,year,price)")
      CarsQueries.insert_car(1, "brandtest", "modeltest", 1021, 9999)

      response = CarsQueries.select_cars_where("brand", "Toyo")
      assert elem(response, 0) == :ok
    end

    test "Select cars where. Should fail" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "CREATE TABLE cars(id,brand,model,year,price)")
      CarsQueries.insert_car(1, "brandtest", "modeltest", 1021, 9999)

      response = CarsQueries.select_cars_where("b", "Toyo")
      assert elem(response, 0) == :error
    end

    test "Delete cars where. Should succes" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "CREATE TABLE cars(id,brand,model,year,price)")
      CarsQueries.insert_car(1, "brandtest", "modeltest", 1021, 9999)

      response = CarsQueries.delete_cars_where("brand", "'tændstikker'")
      assert elem(response, 0) == :ok
    end

    test "Delete cars where. Should fail" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "CREATE TABLE cars(id,brand,model,year,price)")
      CarsQueries.insert_car(1, "brandtest", "modeltest", 1021, 9999)
  end
end

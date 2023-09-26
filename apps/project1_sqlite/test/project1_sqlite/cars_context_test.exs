defmodule Project1Sqlite.CarsContextTest do
  use ExUnit.Case

  alias Project1Sqlite.CarsContext

  setup do

    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Project1Sqlite.Repo)

  end

  describe "Cars CRUD: " do

    test "Get cars" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
      CarsContext.create_car(1,"brandtest","modeltest",1021,9999)

     response = CarsContext.get_cars()
     assert is_map(response)
    end

    test "Create cars. Should succes" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
      response = CarsContext.create_car(1,"brandtest","modeltest",1021,9999)

      assert response == :ok
    end

   # test "Create cars. Should fail" do
     # Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
    #  response = CarsContext.create_car("'1'","brandtest","modeltest",1021,9999)

   #   assert response == :error
  #  end


    test "Get cars with condition. Should succes" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
      CarsContext.create_car(1,"brandtest","modeltest",1021,9999)

     response = CarsContext.get_cars_with_condition("brand","Toyo")
     assert is_map(response)
    end

    test "Get cars with condition. Should fail" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
      CarsContext.create_car(1,"brandtest","modeltest",1021,9999)

     response = CarsContext.get_cars_with_condition("b","Toyo")
     assert is_atom(response)
    end

    test "Delete cars with condion. Should succes" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
      CarsContext.create_car(1,"brandtest","modeltest",1021,9999)

      response = CarsContext.delete_cars_with_condition("brand","'tændstikker'")
      assert is_map(response)
    end

    test "Delete cars with condition. Should fail" do
      Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"CREATE TABLE cars(id,brand,model,year,price)")
      CarsContext.create_car(1,"brandtest","modeltest",1021,9999)

      response = CarsContext.delete_cars_with_condition("b","'tændstikker'")
      assert is_atom(response)
    end


  end
end

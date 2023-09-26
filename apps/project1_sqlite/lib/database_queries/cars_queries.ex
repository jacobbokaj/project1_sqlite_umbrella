defmodule DatabaseQueries.CarsQueries do
  def select_cars() do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "SELECT * FROM cars")
  end

  def select_specific_cars(colum,name) do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "SELECT * FROM cars WHERE #{colum} == #{name}")
  end

  def insert_car(id,brand,model,year,price) do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "INSERT INTO cars (id,brand,model,year,price) VALUES(#{id},#{brand},#{model},#{year},#{price})")
  end
end

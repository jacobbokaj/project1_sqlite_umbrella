defmodule Project1Sqlite.CarsQueries do

  def select_cars() do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "SELECT * FROM cars")
  end

  def select_cars_where(colum,value) do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"SELECT * FROM cars WHERE #{colum} = '#{value}'")
  end

  def insert_car(id,brand,model,year,price) do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo, "INSERT INTO cars (id,brand,model,year,price) VALUES(#{id},'#{brand}','#{model}',#{year},#{price})")
  end

  def delete_cars_where(colum,value) do
    Ecto.Adapters.SQL.query(Project1Sqlite.Repo,"DELETE FROM cars WHERE #{colum} = #{value}")
  end
end
